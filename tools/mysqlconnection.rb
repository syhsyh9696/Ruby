# encoding: utf-8

require 'mysql2'
1000.times do |io|
    client = Mysql2::Client.new(:host => "10.0.0.5", :username => "lab", :password => "default", :database => "labkeychain")
    client.close
    p io
end
