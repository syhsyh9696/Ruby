# encoding: utf-8

i = 0
j = 0
io_temp = File.open("stunum.txt", "w")
File.open("name", "r") do |io|
    while line = io.gets
        line.chomp!
        if i == 3
            p line
            io_temp << line << "\n"
            j = j + 1
        end
        if i == 17
            i = 0
            next
        end
        i = i + 1
    end
end
io_temp.close()
p j
