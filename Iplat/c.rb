# encoding:utf-8
# 统计女生比例

require 'mysql2'
require 'pp'

def c grade
    client = Mysql2::Client.new(:host => '202.194.67.74',
                                :username => 'root',
                                :password => 'default',
                                :database => 'student')
    rate_hash = {}
    
    '01'.upto('31').each do |department|
        sum = client.query("select count(*) from info where stu_num like '2#{grade}#{department}%'").collect { |x| x }[0].values[0]
        female = client.query("select count(*) from info where stu_num like '2#{grade}#{department}%' and stu_gender like '女'").collect { |x| x }[0].values[0]
        rate = (female.to_f / sum.to_f * 100).round(2) if sum != 0
        
        next if rate == nil
        
        dept_name = client.query("select dept_name from department where dept_id like '#{department}'").collect { |x| x }[0].values[0]
        p "#{dept_name} 的女生比例是 #{rate}%"

        rate_hash[dept_name] = rate
    end

    client.close

    lowest = rate_hash.sort_by{ |key, value| value }[0]
    puts "\n\n\n没救的和尚学院 #{lowest[0]} 女生比例 #{lowest[1]}"
end

