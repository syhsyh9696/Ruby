# encoding:utf-8

require 'mysql2'

require_relative 'ecampus_core'

def client
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "default",
                                :database => "student")
end

def ecampus_id
    client = client()
    result = client.query("select stu_num from info_old where id is null and stu_num like '22016%'")
    result = result.collect{|x| x}
    result.each do |item|
        sleep 0.4
        temp = get_id(item["stu_num"][1..-1])
        next if temp == nil
        client.query("update info_old set id=\'#{temp}\' where stu_num=#{item["stu_num"]}")
    end
    client.close
end

ecampus_id
