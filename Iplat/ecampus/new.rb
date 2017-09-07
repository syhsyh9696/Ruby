# encoding:utf-8

require 'nokogiri'
require 'mechanize'
require 'mysql2'
require 'pp'

def mysql
    client = Mysql2::Client.new(:host => "202.194.67.74",
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
    form.yktkh = "2" + number; form.password = number[-6..-1]
    form.click_button

    return nil if ecampus.page.forms[0].errcode == "1"
    # 0 means done
    # 1 means error
    
    ecampus.page.forms[0].click_button
    id_page = ecampus.get("http://ecampus.ujn.edu.cn/myecard.asp")

    doc = Nokogiri::HTML(id_page.body)

    info = []
    doc.search('//td[@colspan="7"]/table/tr/td[2]/div').each do |row|
        info << row.text if row.text != ''
    end
    info.pop; info.pop

    hash = {}
    hash['name'] = info[0]; hash['gender'] = info[1]; hash['id'] = info[-2]
    hash['number'] = info[-1]
    sleep 0.5
    
    insert_info_into_database(hash, number)
end

def insert_info_into_database(info_hash,number)
    client = mysql()
    begin
        client.query("UPDATE stu_2017 SET 
                         stu_name='#{info_hash['name']}',
                         stu_gender='#{info_hash['gender']}',
                         stu_id='#{info_hash['id']}'
                         WHERE 
                         stu_num=#{info_hash['number'][1..-1]}")
    rescue
        pp number
    ensure
        client.close
    end
end


def insert_num_into_database_test()
    client = Mysql2::Client.new(:host => "202.194.67.74",
                                :username => "root",
                                :password => "default",
                                :database => "student")
    result = Dir["../photo/*.jpg"].map! { |e| e.split('/')[-1].gsub('.jpg', '') }
    pp result
    result.each do |item|
        client.query("insert into stu_2017(stu_num) values(#{item})")
    end
        
end

def start
    client = mysql()
    result = client.query("select stu_num from stu_2017 where stu_name is null").collect { |x| x }
    result.shuffle!

    result.each do |item|
        get_id(item['stu_num'])
    end
end

start

