# encoding:utf-8

# EventMachine(EM) 是一个基于 Reactor 设计模式提供事件驱动(event-driven) I/O 的 gem
require 'eventmachine'

EM.run do
    EM.add_timer(1) do
        puts 'sleeping...'
        EM.system('sleep 1') { puts "woke up!" }
        puts 'continuing...'
    end
    EM.add_timer(3) { EM.stop }
end

