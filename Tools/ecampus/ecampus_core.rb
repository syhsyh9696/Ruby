# encoding:utf-8

require 'nokogiri'
require 'mechanize'
require 'pp'

def get_id(number)
    ecampus = Mechanize.new
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

    # io = File.open('./2016_id_num.txt', 'a+')
    # doc.search('//td[@colspan="7"]/table/tr/td[2]/div').each do |row|
    #    io << row.text << "\n" if row.text != ""
    # end
    # io.close
    doc.search('//td[@colspan="7"]/table/tr[6]/td[2]/div').text    
end
