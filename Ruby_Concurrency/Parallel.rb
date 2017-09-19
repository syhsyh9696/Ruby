# encoding:utf-8

range1 = 0...50_000_000
range2 = 50_000_000...100_000_000

number = 99_999_999
puts "Parent #{Process.pid}"

fork { puts "Child1 #{Process.pid}: #{range1.to_a.index(number)}" }
fork { puts "Child2 #{Process.pid}: #{range2.to_a.index(number)}" }

Process.wait
