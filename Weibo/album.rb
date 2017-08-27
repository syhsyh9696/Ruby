# encoding:utf-8

require 'mechanize'
require 'nokogiri'
require 'yaml'
require 'pp'

def users
    config = YAML.load(File.read("config.yml"))
    users = config["users"]
end

def get_albums id 
    url = "http://photo.weibo.com/#{id}/albums/index"

    client = Mechanize.new; client.get url
    pp client.page.body
end

get_albums("5285953719")
