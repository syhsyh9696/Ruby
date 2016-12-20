# encoding: utf-8

require 'socket'

server = TCPServer.open(21000)
loop {
    Thread.start(server.accept) do |client|
        p client.gets
        client.puts(Time.now.ctime) if client.gets == "A-TEST"
        client.puts "Close the connection.Bye!"
        client.close
    end
}
