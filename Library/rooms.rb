# encoding:utf-8

require 'mechanize'
require 'mysql2'
require 'json'
require 'pp'

def mysql
    client = Mysql2::Client.new(:host => "202.194.67.74",
                                :username => "root",
                                :password => "default",
                                :database => "library")
end

def authenticate
    client = Mechanize.new
    client.get "http://seat.ujn.edu.cn/"
    client.get "http://seat.ujn.edu.cn/rest/auth?username=220141222127&password=220141222127"
    client
end

def rooms
    baseurl = "http://seat.ujn.edu.cn/"
    midurl = "mapBook/ajaxGetRooms?building="
    client = mysql()
    page = authenticate()
    
    # building = 1 代表东校区
    # building = 2 代表西校区
    '1'.upto('2').each do |building|
        '1'.upto('8').each do |floor|
            url = baseurl + midurl + building + "&floor=" + floor
            JSON.parse(page.get(url).body)['rooms'].each do |item|
                client.query("insert into rooms values(#{item['id']}, '#{item['name']}', #{building})")
            end
        end
    end
end

