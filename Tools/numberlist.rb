# encoding: utf-8

io_temp = File.open("list.txt", "w")
File.open("allnum.txt", "r") do |io|
	while line = io.gets
		line.chomp!
		if line[0..3] == "2010"
			io_temp << "2#{line}\n"
			p "done!" 
		elsif line[0..3] == "2011"
			io_temp << "2#{line}\n"
		end
	end
end
io_temp.close()
			