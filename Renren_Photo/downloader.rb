# encoding:utf-8

require 'json'
require 'pp'

def downloader file_name, dir_name
    json = File.read(file_name)
    json = JSON.parse(json)

    photo_list = json['photoList']
    
    photo_list.each do |item|
        # item['url'] => photo url
        system("wget -q -P ./#{dir_name}/ #{item['url']}")
    end

end

def find_dir name, file_type
    photo_url_file = Dir["./#{name}/*.#{file_type}"]
    photo_url_file.each do |item|
        downloader(item, name)
    end
end

find_dir('曹家悦', 'txt')

