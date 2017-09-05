# encoding: utf-8

#require 'mysql2'

def ecampus_insert
    File.open("2016_id_num.txt", "r") do |io|
        while line = io.gets
            p io.lineno
        end
    end
end

ecampus_insert
