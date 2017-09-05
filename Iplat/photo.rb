# encoding:utf-8

require 'mechanize'
require 'json'
require 'mysql2'
require 'pp'

def download_photo(stu_num)
    client = Mechanize.new
    error_code = ''
    # Downloader
    begin
        url = "http://iplat.ujn.edu.cn/photo/#{stu_num[0..3]}/#{stu_num}.jpg"
        client.get url
        client.get(url).save("./photo/#{stu_num}.jpg") if !File.exist?("./photo/#{stu_num}.jpg")
        time = rand(9) * 0.01; sleep(time)
    rescue Mechanize::ResponseCodeError => e
        error_code = e.response_code
    end

    error_code
end

=begin
'01'.upto('50').each do |department|
    '01'.upto('99').each do |major|
        download_photo("2017#{department}#{major}001")
    end
end
=end

def department_num
    Dir["./photo_old/*.jpg"].map! { |e| e.split('/')[-1].gsub('001.jpg', '') }
end

def download_all_photo
=begin
    array = department_num()    
    array.each do |element|
        '001'.upto('500').each do |student|
            download_photo(element + student)
        end
    end
=end

    array = test_whether_students_over_500()
    array.each do |element|
        '501'.upto('999').each do |student|
            download_photo(element + student)
        end
    end
end

def test_whether_students_over_500
    array = department_num()
    result = []
    array.each do |element|
        result << element if download_photo(element + '500') == ''
    end

    result
end

# download_all_photo
# test_whether_students_over_500

def store_all_number filename
    io = File.open(filename, 'w')
    result = Dir["./photo/*.jpg"].map! { |e| e.split('/')[-1].gsub('.jpg', '') }
    result.each do |item|
        io << item << "\n"
    end
    io.close
end

store_all_number('2017_id_num.txt')
