require 'net/http'
require 'json'
require 'pp'

def getToken
    stuNum = ARGV[0].to_s
    stuPwd = ARGV[1].to_s
    if stuNum.length != 12
        p "Wrong student number!"
        return nil
    end
    temp = "http://seat.ujn.edu.cn/rest/auth?username=#{stuNum}&password=#{stuPwd}"
    url = URI(temp)
    json = Net::HTTP.get(url)
    obj = JSON.parse(json)
    if obj["status"] == "success"
        return obj["data"]["token"]
    else
        p "Connection wrong!"
    end
end

def checkToken
    temp = "http://seat.ujn.edu.cn/rest/v2/user/reservations?token=#{getToken}"
    url = URI(temp)
    json = Net::HTTP.get(url)
    obj = JSON.parse(json)
    if obj["status"] == "success"
        return true
    else
        return false
    end
end

def getBuildingsInfo
    temp = "http://seat.ujn.edu.cn/rest/v2/room/stats2/2?token=#{getToken}"
    url = URI(temp)
    json = Net::HTTP.get(url)
    obj = JSON.parse(json)
    if obj["status"] == "success"
        obj["data"].each do |room|
            p "ID:#{room["roomId"]} #{room["room"]} 楼层:#{room["floor"]} 剩余:#{room["free"]}"
        end
    else
        p "Failed to get information from client"
    end
end

def getSeatInfo
    begintimeurl
end
