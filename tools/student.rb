# encoding:utf-8

require 'mechanize'
require 'json'
require 'mysql2'
require 'pp'

def client()
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "grys003",
                                :database => "student_dl")
end




def get_face_url stu_id
    client = Mechanize.new
    value = Base64.encode64(File.read("#{stu_id}.jpg"))

    client.post "http://kan.msxiaobing.com/Api/Image/UploadBase64", value

    json = JSON.parse(client.page.body)
end

def get_face_mark url
    client = Mechanize.new
    client.user_agent = Mechanize::AGENT_ALIASES.values[rand(21)]
    # json = get_face_url(stu_id); value = Hash.new

    value = "MsgId=" + Time.new.to_i.to_s + "063" + "&CreateTime=" + Time.new.to_i.to_s + "&Content%5BimageUrl%5D="+ "https://mediaplatform.msxiaobing.com" + url

    result = client.post "http://kan.msxiaobing.com/Api/ImageAnalyze/Process?service=yanzhi",
                         value, ({'Content-Type' => 'application/x-www-form-urlencoded'})

    mark = JSON.parse(result.body)

    mark['content']['text'].encode("UTF-8")
end

def upload_photo
    client = client()

    result = client.query("select stu_num from info_old where stu_num like '22014%'")
    result = result.collect{ |x| x }
    
    result.each do |item|
        begin
            json = get_face_url(item["stu_num"])
        rescue
            next
        end

        client.query("update info_old set ms_url=\'#{json['Url']}\' where stu_num=\'#{item["stu_num"]}\'")
    end

    client.close
end

def ms_mark
    client = client()
    result = client.query("select ms_url, stu_num from info_old 
           where stu_num like '22014%' and ms_url is not null and ms_mark is null")

    result = result.collect{ |x| x }
    result.each do |item|
        # temp.class = Json
        next if item == nil
        mark_temp = get_face_mark(item['ms_url']).to_s
        # mark_temp = temp['content']['text'].to_s
        if mark_temp =~ /\d\d.\d/
            client.query("update info_old set ms_mark=10.0 where stu_num=\'#{item['stu_num']}\'")
        elsif mark_temp =~ /\d.\d/
            mark = mark_temp.match(/\d.\d/)[0].to_f
            client.query("update info_old set ms_mark=#{mark} where stu_num=\'#{item['stu_num']}\'")
        else
            next
        end
    end
    client.close
end

ms_mark
