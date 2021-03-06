# encoding: utf-8
# Array

a = Array.new #创建array的时候推荐使用这样的方法
p a
a = Array.new(5)
p a
a = Array.new(5, 0)
p a

# 创建不含空白的字符串的时候 可以使用 %w
lang = %w(Ruby Perl Python Scheme Pike REBOL) #注意本例中间没有逗号
# 使用%w方法时 并非只可以使用() 也可以使用<> || // AA等任意字符 通常用() <> ||
p lang

lang1 = %i<Ruby Perl Python Scheme Pike REBOL>
# 使用%i方法时 并非只可以使用() 也可以使用<> || // AA等任意字符 通常用() <> ||
p lang1

# 索引的使用方法
alpha = ["a", "b", "c", "d", "e"]
p alpha[1]
p alpha[1..3]
p alpha[1...3] #表示从alpha[1] - alpha[n-1]
p alpha[1,3]
p alpha[-1] #如果索引是负数的话 从后往前计数
