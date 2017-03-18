# require 'socket'
require_relative '../commmon_handler'

module FTP
    CRLF = "\r\n"

    class Serial
        def initialize(port = 21)
            @control_socket = TCPServer.new(port)
            trap(:INT) { exit }
        end
    end
end
