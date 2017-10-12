# encoding:utf-8

require 'mysql2'
require 'mechanize'
require 'json'
require 'pp'

client = Mysql2::Client.new(:host => '10.0.0.51',
                            :username => 'root',
                            :password => 'grys003',
                            :database => 'library')

page = Mechanize.new
page.get "http://seat.ujn.edu.cn/rest/auth?username=220141222001&password=220141222001"
token = JSON.parse(page.page.body)['data']['token']

room = client.query("select id from rooms").collect{ |x| x['id'] }
room.each do |id|
    page.get "http://seat.ujn.edu.cn/rest/v2/room/layoutByDate/#{id}/2017-09-20?token=#{token}"
    json = JSON.parse(page.page.body)
    seat_loc = json['data']['name']
    puts seat_loc
    json['data']['layout'].each do |seat|
        seat = seat[1]
        next if seat['type'] != 'seat'
        seat_name = "#{seat_loc}#{seat['name']}号"
        client.query("insert into seats(id, seat_id, seat_name, room_id)
                             values(#{seat['id']}, '#{seat['name']}', '#{seat_name}', '#{id}')")
    end
end


client.close
