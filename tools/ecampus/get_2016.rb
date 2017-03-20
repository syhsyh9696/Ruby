# encoding:utf-8

io_temp = File.open("2016_num.txt", "w")
File.open("allnum.txt", "r") do |io|
    while line = io.gets
        line.chomp!
        io_temp << line << "\n" if line[0..3] == "2016"
    end
end
io_temp.close
        
