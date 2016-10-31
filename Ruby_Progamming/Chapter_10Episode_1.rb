# encoding: utf-8
# 异常
def copy(from, to)
	src = File.open(from)
	begin
		dst = File.open(to, "w")
		data = src.read
		dst.write(data)
		dst.close
	rescue Exception => e
		src.close
		p Exception
	end
end
copy("./new.txt", "newtest.txt")