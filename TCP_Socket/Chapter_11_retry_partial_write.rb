# encoding:utf-8
require 'socket'
client = TCPSocket.new('localhost', 4481)
payload = 'Lorem ipsum' * 10000

begin
    loop do
        bytes = client.write_nonblock(payload)

        break if bytes >= payload.size
        payload.slice!(0, bytes)
        IO.select(nil, [client])
    end

rescue Error::EAGAIN
    IO.select(nil, [client])
    retry
end
