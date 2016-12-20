# encoding: utf-8

require 'telegram/bot'

token = '299913435:AAH0acebPnG2CuaXNU9mv2jwaKgprDbGzuQ'
Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        temp = message.chat.id
        p temp
        p temp.class()
        #bot.api.send_message(chat_id:-1001096433310, text: "test")
    end
end
