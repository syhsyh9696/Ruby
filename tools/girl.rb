# encoding: utf-8

io_temp = File.open("girl_temp.txt", "w")
File.open("girl.txt", "r") do |io|
    while line = io.gets
        line.chomp!
        array = line.split()
        if array[1] == "女"
            io_temp << array[0] << "\n"
        end
    end
end
io_temp.close()
