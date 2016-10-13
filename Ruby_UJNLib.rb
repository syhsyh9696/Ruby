# encoding: utf-8

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
    url = "http://seat.ujn.edu.cn/rest/auth?username=#{stuNum}&password=#{stuPwd}"
    json = JSON.parse(Net::HTTP.get(URI(url)))
    if json["status"] == "success"
        return json["data"]["token"]
    else
        p "Connection wrong!"
    end
end

def checkToken
    url = "http://seat.ujn.edu.cn/rest/v2/user/reservations?token=#{getToken}"
    json = JSON.parse(Net::HTTP.get(URI(url)))
    if json["status"] == "success"
        return true
    else
        return false
    end
end

def getBuildingsInfo
    url = "http://seat.ujn.edu.cn/rest/v2/room/stats2/2?token=#{getToken}"
    json = JSON.parse(Net::HTTP.get(URI(url)))
    if json["status"] == "success"
        json["data"].each do |room|
            p "ID:#{room["roomId"]} #{room["room"]} 楼层:#{room["floor"]} 剩余:#{room["free"]}"
        end
    else
        p "Failed to get information from client"
    end
end

def getSeatInfo
    temp = "http://seat.ujn.edu.cn/rest/v2/startTimesForSeat/#{seat}/#{date}/#{getToken}"
    beginurl = URI(temp)
    beginjson = Net::HTTP.get(beginurl)
    obj = JSON.parse(beginjson)
    startlist = obj["data"]["startTimes"]

    hour = 480
    
end
