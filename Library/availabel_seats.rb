# encoding:utf-8

require 'pp'
require 'json'
require 'mysql2'
require 'mechanize'

def check m_page, num
    m_page.get "http://seat.ujn.edu.cn/rest/auth?username=#{num}&password=#{num}"
    json = JSON.parse(m_page.page.body)
    
    return false if json['status'] != "success"

    m_page.get "http://seat.ujn.edu.cn/rest/v2/history/1/20?token=#{json['data']['token']}"
    json = JSON.parse(m_page.page.body)
    pp json['data']['reservations'].class
end

check(Mechanize.new, 220141222124)

client = Mysql2::Client.new(:host => "127.0.0.1",
                            :username => "root",
                            :password => "default",
                            :database => "student")

user = client.query("select stu_num from stu_2017").collect{ |x| x }
user = user.each_slice(1000).to_a
thread = []

user.each do |array|
    
end
