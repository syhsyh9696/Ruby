# encoding: utf-8

io_temp = File.open("stunum.txt", "w")
File.open("name", "r") do |io|
    while line = io.gets
        line.chomp!
        if (io.lineno % 18) == 4
            p line + "            [Done]"
            io_temp << line << "\n"
        #elsif (io.lineno % 18) == 6
            #io_temp << line << "\t"
        #elsif (io.lineno % 18) == 10
            #io_temp << line << "\t"
        #elsif (io.lineno % 18) == 0
            #io_temp << line << "\n"
        end
    end
end
io_temp.close()
