# encoding: utf-8

require 'telegram/bot'

base_url = "http://iplat.ujn.edu.cn/photo/"
def randomnum()
    seed = Random.rand(24370)
    seed = seed + 1
    File.open("stunum.txt", "r") do |io|
        while line = io.gets
            line.chomp!
            column = line.split(/ /)
            if io.lineno == seed
                return column
            end
        end
    end
    return nil
end

token = '299913435:AAH0acebPnG2CuaXNU9mv2jwaKgprDbGzuQ'
Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        #p message.text
        case message.text
        when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello,#{message.from.first_name}")
        when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "bye,#{message.from.first_name}")
        when '/random'
            line = randomnum()
            fn = "#{line[0].to_s}.jpg"
            url = base_url + "#{line[0][1..4]}/" + fn[1..15]
            #bot.api.send_message(chat_id: message.chat.id, text: "#{line}")
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}", caption: "#{line[0]}>>#{line[1]}>>#{line[2]}>>#{line[3]}")
        when '/random@ujnphotobot'
            line = randomnum()
            fn = "#{line[0].to_s}.jpg"
            url = base_url + "#{line[0][1..4]}/" + fn[1..15]
            #bot.api.send_message(chat_id: message.chat.id, text: "#{line}")
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}", caption: "#{line[0]}>>#{line[1]}>>#{line[2]}>>#{line[3]}")
        end
    end
end
