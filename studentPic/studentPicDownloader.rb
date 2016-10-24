# encoding: utf-8
require 'open-uri'

base_url = "http://iplat.ujn.edu.cn/photo/"
File.open("stunum.txt", "r") do |io|
    while line = io.gets
        line.chomp!
        fn = "#{line.to_s}.jpg"
        url = base_url + "#{line[1..4]}/" + fn[1..15]
        open(url) do |io|
            f = File.new(fn, "w")
            if f
                f.write(io.read)
            else
                p "Open file error"
            end
            f.close()
        end
        p url + "Done!"
    end
end
