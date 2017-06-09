# encoding:utf-8

def insert_into_db
    File.open("result_2016.txt", "r") do |io|
        while line = io.gets
            temp = line.split
            p temp
        end

    end
end

insert_into_db()
