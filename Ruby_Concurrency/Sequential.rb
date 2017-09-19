# encoding:utf-8

# Use range
# Ruby range 是一个范围类 可以进行迭代 可以转化为Array

range = 0...100_000_000
number = 99_999_999

puts range.to_a.index(number)
