# encoding: utf-8

require 'telegram/bot'

base_url = "http://iplat.ujn.edu.cn/photo/"
def randomnum()
    seed = Random.rand(24370)
    seed = seed + 1
    File.open("stunum.txt", "r") do |io|
        while line = io.gets
            line.chomp!
            if io.lineno == seed
                return line
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
        when '/photo'
            line = randomnum()
            fn = "#{line.to_s}.jpg"
            url = base_url + "#{line[1..4]}/" + fn[1..15]
            #bot.api.send_message(chat_id: message.chat.id, text: "#{line}")
            bot.api.send_chat_action(chat_id: message.chat.id, action: "upload_photo")
            bot.api.send_photo(chat_id: message.chat.id, photo: "#{url}", caption: "#{line}")
        when '/randomstu'
            line = randomnum()
            fn = "#{line.to_s}.jpg"
            url = base_url + "#{line[1..4]}/" + fn[1..15]
            id = message.chat.id.to_s
            bot.api.send_chat_action(chat_id: id, action: "upload_photo")
            bot.api.send_photo(chat_id: id, photo: "#{url}", caption: "#{line}")
        end
    end
end
