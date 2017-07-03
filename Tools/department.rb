# encoding:utf-8

require 'mysql2'
require 'pp'

def client
    client = Mysql2::Client.new(:host => "127.0.0.1",
                                :username => "root",
                                :password => "default",
                                :database => "student")
end

def student_dept
    client = client()
    result = client.query("select stu_num,department from info_old where stu_num like '22013%'")
    client.close
    result = result.collect{ |x| x }
    dept = Array.new
    
    result.each do |item|
        item["stu_num"] = item["stu_num"][5..8]
        dept << item.values if item["department"] != "其他"
    end
    
    dept.uniq
end

def dept_insert 
    client = client()
    dept = student_dept()
    dept.each do |item|
        client.query("insert into department(dept_num, dept_name) values('#{item[0]}','#{item[1]}')")
    end
    client.close

end

dept_insert
