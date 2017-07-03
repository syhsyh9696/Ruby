# encoding:utf-8

require 'mechanize'
require 'nokogiri'
require 'mysql2'
require 'pp'

client = Mechanize.new
mysql_client = Mysql2::Client.new(:host => "127.0.0.1",
                                  :username => "root",
                                  :password => "grys003",
                                  :database => "stats")

client.get "http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/201703/t20170310_1471429.html"

doc = Nokogiri::HTML(client.page.body)
=begin
doc.search("//p[@class='MsoNormal']").each do |item|
    if item.search("./span[2]").children[0] != nil
        num = item.search("./span[2]").children[0].text
        nam = item.search("./span[3]").children[0].text.strip.gsub('　', '')
        mysql_client.query("insert into xzqhdm(num, name) values('#{num}','#{nam}')")
    else
        next
    end
end
=end

doc.search("//p[@class='MsoNormal']").each do |item|
    if item.search("./b").children[0] != nil
        num = item.search("./b[1]/span[1]").children[0].text
        pp nam = item.search("./b[2]/span[1]").children[0].text.strip
        # mysql_client.query("insert into xzqhdm(num, name) values('#{num}','#{nam}')")
    else
        next
    end
end
