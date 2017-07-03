# encoding:utf-8

require 'socket'

# Define Ftp Server Parameters
hostname = '127.0.0.1'
port = 4481

client = TCPSocket.open(hostname, port)

def send_command(client, comm)
    client.puts(comm)
    p client.gets.strip
end

send_command(client, "syst\r\n")
send_command(client, "user\r\n")
send_command(client, "list\r\n")
send_command(client, "quit\r\n")


