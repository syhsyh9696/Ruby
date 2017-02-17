require 'telegram/bot'
require 'ghee'
require 'time'
require 'pp'

TOKEN = "298625375:AAG51PT_LTCGbsZdiAqdFIJcPRbtPyNZ1xw"
gh = Ghee.basic_auth("syhsyh9696", "syhsyh96031500")
updatetime = Hash.new

def gettime(updatetime, authentication)
    File.open("alluser.txt", "r") do |io|
        while line = io.gets
            line.chomp!
            updatetime[line] = Time.parse(pushed_at(line, authentication).to_s.gsub!(/T/, " ").gsub!(/Z/, ""))
        end
    end
end

def pushed_at(user, authentication)
    return authentication.repos(user, "#{user}.github.io").to_h['pushed_at']
end

def check(updatetime, authentication)
    newupdatetime = Hash.new
    str = String.new

    gettime(newupdatetime, authentication)
    return str if(updatetime == newupdatetime)

    updatetime.each do |key, value|
        str << "#{key} update Blogs at #{value}\n" if newupdatetime[key] > value
    end

    updatetime = newupdatetime
    return str if (str != 0)
end

gettime(updatetime, gh)
pp updatetime

sleep 50
p check(updatetime, gh)

p "update time"
pp updatetime
