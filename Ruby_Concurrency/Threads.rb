# encoding:utf-8
# Threads.rb
# Race Condition

@executed = false

def ensure_executed
    unless @executed
        puts "executing!"
        @executed = true
    end
end

threads = 10.times.map { Thread.new { ensure_executed } }
threads.each(&:join)

puts "Done!"
