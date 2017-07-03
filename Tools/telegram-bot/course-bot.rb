# encoding: utf-8

require 'open-uri'
require 'uri'
require 'telegram/bot'

require_relative "classProfile"

TOKEN = "200092971:AAHYRnWGp-LvLJBLudgCZ4OC_Ihrct4Z01k"

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        substr = message.text.split(" ")
        if substr[0] == nil
            next
        end
        case substr[0]
        when '/schedule'
            if substr[1] != nil
                info = substr[1].split("#")
                unless info[0].length == 11
                    bot.api.send_message(chat_id: message.chat.id, text: "Please enter student number like this <<20141000000>>")
                    next
                end
                individual = Profile.new(info[0], info[1])
                url = URI(individual.personalURL)
                open(url) do |io|
                    schedule = File.new("temp", "a")
                    if schedule
                        schedule.write(io.read)
                    else
                        p "Open url error"
                    end
                    bot.api.send_message(chat_id: message.chat.id, text: "Done!")
                end
            else
                next
            end
        end

    end
end
