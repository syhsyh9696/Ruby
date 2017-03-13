# encoding:utf-8
# run 'nc -l localhost 4481' in an other terminal

require 'socket'
client = TCPSocket.new('localhost', 4481)
payload = 'SB JCT' * 10000

written = client.write_nonblock(payload)
p "payload block = #{payload.size}"
p "written block = #{written}"
written < payload.size # written.size.class == int
