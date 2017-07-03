# encoding:utf-8
require_relative "require"
require_relative "unicorn"

flag = 0
result = File.open("result.txt", "w")
File.open("2016_num.txt", "r") do |io|
    while line = io.gets
        if flag == 10
            sleep(2)
            flag = 0
        end
            
        line = line.chomp!
        temp = Unicorn::res_process(Unicorn::post_request(line))
        result << temp if temp != ""
        flag += 1
    end
end
result.close
            
