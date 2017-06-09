# encoding:utf-8

require 'mysql2'

def client
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "default",
                                :database => "student")
end

def match stu_num, client
    result = client.query("select * from info where stu_num like #{stu_num.to_s}")
    temp = result.collect{ |x| x }

    return temp[0] if !temp.empty?
    return nil
end

def insert stu_num
    client = client()
    result = match(stu_num, client)
    if result == nil
        client.close; return nil
    end
    
    client.query("update info_old set department=\'#{result["stu_dept"]}\' where stu_num=#{stu_num.to_s}")
    client.query("update info_old set id=\'#{result["stu_id"]}\' where stu_num=#{stu_num.to_s}")
    client.close
end

client = client()
result = client.query("select stu_num from info_old where stu_num like '22016%'")
client.close

result = result.collect{ |x| x }
result.each do |item|
    insert(item["stu_num"])
end
