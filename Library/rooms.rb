# encoding:utf-8

require 'mechanize'
require 'mysql2'
require 'json'
require 'pp'

def mysql
    client = Mysql2::Client.new(:host => "10.0.0.51",
                                :username => "root",
                                :password => "default",
                                :database => "library-seats-api_development")
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
    client.close
end

def rooms_mobile
  '1'.upto('2').each do |item|
    url = "http://seat.ujn.edu.cn/rest/v2/room/stats2/#{item}?token="
    page = authenticate()
    client = mysql()

    token = JSON.parse(page.page.body)['data']['token']
    url = url + token
    page.get url

    JSON.parse(page.page.body)['data'].each do |e|
      if item == '1'
        client.query("insert into rooms(id, name, campus, floor, seats) values(#{e['roomId']}, '#{e['room']}', '济南大学东校区', '#{e['floor']}', '#{e['totalSeats']}')")
      else
        client.query("insert into rooms(id, name, campus, floor, seats) values(#{e['roomId']}, '#{e['room']}', '济南大学西校区', '#{e['floor']}', '#{e['totalSeats']}')")
      end

    end
  end

end


def seats_mobile

end
