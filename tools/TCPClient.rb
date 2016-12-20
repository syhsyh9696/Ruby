# encoding: utf-8

require 'socket'

hostname = '127.0.0.1'
port = 21000

client = TCPSocket.open(hostname, port)
client.puts "A-TEST"

while line = client.gets
    p line.chop
end

client.close
