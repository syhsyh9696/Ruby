# encoding: utf-8

require 'telegram/bot'

base_url = "http://iplat.ujn.edu.cn/photo/"
TOKEN = '299913435:AAH0acebPnG2CuaXNU9mv2jwaKgprDbGzuQ'

def randomnum()
    seed = Random.rand(24370) + 1
    File.open("stunum.txt", "r") do |io|
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

def help()
    temp = ("/start - Start this bot\n" +
            "/stop - Stop this bot\n" +
            "/random - Get random picture and information\n" +
            "/num - Get specify picture (/num 20130000000)")
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
        when '/num'
            if substr[1] == nil
                bot.api.send_message(chat_id: message.chat.id, text: "Can't find the student number")
                next
            end
            stunum = substr[1].to_s
            url = base_url + "#{stunum[0..3]}/#{stunum}.jpg"
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}")
        when '/help'
            bot.api.send_message(chat_id: message.chat.id, text: "#{help()}")
        end
    end
end
