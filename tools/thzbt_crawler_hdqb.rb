# encoding:utf-8

require 'mechanize'
require 'nokogiri'
require 'mysql2'
require 'pp'

def client(database)
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "XuHefeng",
                                :database => database)

end

def info_insert(info_array)
    client = client("thzbt")

    # Insert video data(License, Title, Link)
    info_array.each do |item|
        begin
            client.query("insert into hd_qb(thz_id, license, title) values('#{item[2]}','#{item[0].upcase.strip}','#{item[1].strip}')")
        rescue
            next
        end
    end

    client.close
end

def page_download(max_num)
    info_array = Array.new
    thz = Mechanize.new
    
    1.upto(max_num).each do |page_num|
        thz.user_agent = Mechanize::AGENT_ALIASES.values[rand(21)]
        
        url = "http://taohuabbs.org/forum.php?mod=forumdisplay&fid=220&typeid=91&typeid=91&filter=typeid&page=#{page_num}"
        thz.get url
        Nokogiri::HTML(thz.page.body).search('//table[@id="threadlisttableid"]/tbody').each do |row| 
            # Thzbt.id => row.attributes["id"].value
            next if row.attributes["id"].value == 'separatorline'

            row.search('./tr/th/a[@class="s xst"]').each do |item|
                # Basic info: item.text
                temp = item.text.gsub('[', '').split(']')
                temp << row.attributes["id"].value
                info_array << temp
            end
        end
        info_insert(info_array)
        info_array.clear
    end
end

def insert_torrent_identifier
    client = client("thzbt")
    result = client.query("select thz_id from hd_qb where torrent_identifier is null")
    result = result.collect{ |x| x }
    
    thz = Mechanize.new
    
    result.each do |hash|
        thz.user_agent = Mechanize::AGENT_ALIASES.values[rand(21)]
        # hash["thz_id"].split('_')[-1] thz_bt id
        url = "http://taohuabbs.org/thread-#{hash["thz_id"].split('_')[-1]}-1-1.html"

        thz.get url
        Nokogiri::HTML(thz.page.body).search('//p[@class="attnm"]/a').each do |item|
            # Torrent Hash: item.attributes["href"].value.split('=')[-1]
            client.query("update hd_qb set torrent_identifier=\'#{item.attributes["href"].value.split('=')[-1]}\' where thz_id=\'#{hash["thz_id"]}\'")
        end
        
    end
    
    client.close
end

def torrent_generator
    baseurl = "http://taohuabbs.org/forum.php?mod=attachment&aid="
    client = client('thzbt')
    result = client.query("select torrent_identifier, license from hd_qb where torrent_identifier is not null")
    client.close
    result = result.collect{ |x| x }
    
    result.each do |item|
        url = baseurl + item["torrent_identifier"].gsub('%3D', '')
        next if system("wget -q -O #{item["license"]}.torrent #{url}")
    end

end

page_download(228)

insert_torrent_identifier()
# torrent_generator
