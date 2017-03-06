# encoding:utf-8

require 'socket'
module CloudHash
    class Client
        class << self
            attr_accessor :host, :port
        end

        def self.get(key)
            request "GET #{key}"
        end

        def self.set(key, value)
            request "SET #{key} #{value}"
        end

        def self.request(string)
            @client = TCPSocket.new(host, port)
            @client.write(string)

            @client.close_write

            @client.read
        end
    end
end

CloudHash::Client.host = "localhost"
CloudHash::Client.port = 21000
puts CloudHash::Client.set 'Sun', '1'
puts CloudHash::Client.get 'Sun'
puts CloudHash::Client.get 'v'
