# encoding:utf-8

require 'socket'
module CloudHash
    class Server
        def initialize(port)
            @server = TCPServer.new(port)
            p "Listening on port #{@server.local_address.ip_port}"
            @storage = {}
        end

        def start
            Socket.accept_loop(@server) do |connection|
                handle(connection)
                connection.close
            end
        end

        def handle(connection)
            request = connection.read
            connection.write process(request)
        end

        # SET key value
        # GET key value
        def process(request)
            command, key, value = request.split
            case command.upcase
            when 'GET'
                @storage[key]
            when 'SET'
                @storage[key] = value
            end
            display
        end

        def display
            puts @storage
        end
    end
end

server = CloudHash::Server.new(21000)
server.start
