# endcoding: utf-8

require 'mysql2'
require 'digest'

io = File.open("stucardMD5.txt", "w")

mysql = "10.0.0.5"
Client = Mysql2::Client.new(:host => "#{mysql}", :username => "lab", :password => "default", :database => "labkeychain")

card = Client.query("SELECT stucard FROM mytable")
card.each do |row|
    temp = Digest::MD5.hexdigest "#{row["stucard"]}"
    io << temp << "\n"
end

io.close

md5card = Array.new
File.open("stucardMD5.txt", "r") do |io|
    while line = io.gets
        line.chomp!
        md5card << line
    end
end

flag = 0
info = Client.query("SELECT * FROM mytable")
info.each do |row|
    Client.query("INSERT INTO user VALUES('#{row["stuname"]}','#{row["stunumber"]}','#{row["stuclass"]}','#{md5card[flag]}')")
    flag = flag + 1
end
