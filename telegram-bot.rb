# encoding: utf-8

require 'telegram/bot'

base_url = "http://iplat.ujn.edu.cn/photo/"
TOKEN = '299913435:AAH0acebPnG2CuaXNU9mv2jwaKgprDbGzuQ'

def randomnum()
    seed = Random.rand(24370) + 1
    File.open("student.ini", "r") do |io|
        while line = io.gets
            line.chomp!
            column = line.split()
            if io.lineno == seed
                return column
            end
        end
    end
    return nil
end

def randomgirl()
    seed = Random.rand(12923) + 1
    File.open("student_girl.ini", "r") do |io|
        while line = io.gets
            line.chomp!
            if io.lineno == seed
                return line
            end
        end
    end
    return nil
end

def help()
    temp = ("/start - Start this bot\n" +
            "/stop - Stop this bot\n" +
            "/random - Get random picture and profile\n" +
            "/randomgirl - Get random girl picture\n" +
            "/num - Get specify picture (/num 20130000000)" +
            "/name - Get specift picture ")
end

def checkname(name)
    array = Array.new
    File.open("student.ini", "r") do |io|
        while line = io.gets
            line.chomp!
            column = line.split()
            if name == column[1]
                array << column
            end
        end
    end
    if array.size != 0
        return array
    else
        return nil
    end
end

def checknumber(num)
    File.open("student.ini", "r") do |io|
        while line = io.gets
            line.chomp!
            temp = line.split()
            if num == temp[0][1..11]
                return true
            end
        end
    end
    return false
end

def namelog(line, username, first_name, last_name)
    time = Time.now
    io = File.open("slectedname.log", "a")
    io << "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:#{time.sec}"
    io << " /#{username} #{first_name}_#{last_name}/" << " #{line}\n"
    io.close()
end

def numberlog(line, username, first_name, last_name)
    time = Time.now
    io = File.open("slectednumber.log", "a")
    io << "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:#{time.sec}"
    io << " /#{username} #{first_name}_#{last_name}/" << " #{line}\n"
    io.close()
end

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        substr = message.text.split(" ")
        case substr[0]
        when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello,#{message.from.first_name}")
        when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye,#{message.from.first_name}")
        when '/random'
            line = randomnum()
            fn = "#{line[0].to_s}.jpg"
            url = base_url + "#{line[0][1..4]}/" + fn[1..15]
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}", caption: "#{line[0]}>>#{line[1]}>>#{line[2]}>>#{line[3]}")
        when '/random@ujnphotobot'
            line = randomnum()
            fn = "#{line[0].to_s}.jpg"
            url = base_url + "#{line[0][1..4]}/" + fn[1..15]
            #bot.api.send_message(chat_id: message.chat.id, text: "#{line}")
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}", caption: "#{line[0]}>>#{line[1]}>>#{line[2]}>>#{line[3]}")
        when '/randomgirl'
            line = randomgirl()
            fn = "#{line.to_s}.jpg"
            url = base_url + "#{line[1..4]}/" + fn[1..15]
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
        when '/randomgirl@ujnphotobot'
            line = randomgirl()
            fn = "#{line.to_s}.jpg"
            url = base_url + "#{line[1..4]}/" + fn[1..15]
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
        when '/num'
            if substr[1] == nil
                bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
                bot.api.send_message(chat_id: message.chat.id, text: "Can't find the student number")
                next
            end
            if checknumber(substr[1])
                stunum = substr[1].to_s
                url = base_url + "#{stunum[0..3]}/#{stunum}.jpg"
                bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
                bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
                numberlog(substr[1], message.from.username, message.from.first_name, message.from.last_name)
            else
                bot.api.send_chat_action(chat_id: message.chat.id, action: "typing")
                bot.api.send_message(chat_id: message.chat.id, text: "Can't find the student number")
                next
            end
        when '/help'
            bot.api.send_message(chat_id: message.chat.id, text: "#{help()}")
        when '/doge'
            url = base_url + "2014/20141222216.jpg"
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
        when '/ha'
            bot.api.send_chat_action(chat_id: message.chat.id, action: "typing")
            bot.api.send_sticker(chat_id: message.chat.id, sticker: "BQADBQADBgADqno2BgFR4Dylw9eQAg")
            bot.api.send_message(chat_id: message.chat.id, text: "不要总想搞个大新闻")
        when '/ha@ujnphotobot'
            bot.api.send_chat_action(chat_id: message.chat.id, action: "typing")
            bot.api.send_sticker(chat_id: message.chat.id, sticker: "BQADBQADBgADqno2BgFR4Dylw9eQAg")
            bot.api.send_message(chat_id: message.chat.id, text: "不要总想搞个大新闻")
        when '/name'
            if substr[1] == nil
                bot.api.send_message(chat_id: message.chat.id, text: "Can't find the student name")
                next
            end
            line = checkname(substr[1])
            if line == nil
                bot.api.send_message(chat_id: message.chat.id, text: "Can't find the student name")
            elsif line.size == 1
                fn = "#{line[0][0].to_s}.jpg"
                url = base_url + "#{line[0][0][1..4]}/" + fn[1..15]
                bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
                bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
                namelog(substr[1], message.from.username, message.from.first_name, message.from.last_name)
            elsif line.size > 1
                bot.api.send_chat_action(chat_id: message.chat.id, action: "typing")
                bot.api.send_message(chat_id: message.chat.id, text: "一共有#{line.size}个名字为<<#{substr[1]}>>的人")
                line.size.times do |i|
                    fn = "#{line[i][0].to_s}.jpg"
                    url = base_url + "#{line[i][0][1..4]}/" + fn[1..15]
                    bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
                    bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
                end
                namelog(substr[1], message.from.username, message.from.first_name, message.from.last_name)
            end
        end
    end
end
