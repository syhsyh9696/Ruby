# encoding: utf-8
# 数据类
# 数据类都被定义为了Numeric的子类

=begin
数值类的继承关系
Numeric ------>Integer ------>Fixnum 计算机可以处理的数值
        ------>Float   ------>Bignum 比Fixnum更大的数值类
        ------>Rational
        ------>Complex
=end

a = Rational(2, 5) #Rational是有理数类用小数的方法进行表示
b = Rational(1, 3)

p a
p b
c = a + b
p c
p c.to_f

p 5.div(2) #div用于返回 x 除以 y后的商的整数
p -5.div(2)
p 5.quo(2) #x 除以 y的商
p 5.modulo(2) #x % y
p 5.divmod(2) #x 除以 y 的商和余数作为数组返回
p 5.remainder(2) #返回X 除以Y的余数 结果的付i好和X的符号一致

# math模块 具体见基础教程P155

# 数值类型的转换
p 10.to_f
p 10.8.to_f
p -10.8.to_f
p "234".to_i
p "23.4".to_f
p 1.5.to_r #转换为Rational对象
p 1.5.to_c #转换为Complex对象

p 1.2.round #to_i方法会把小数点以后的所有值去掉 round方法会把小数点四舍五入
p 1.5.ceil #ceil方法返回接收者大的最小整数
p 1.5.floor #floor方法返回接收者小的最大整数

=begin
Interger可以执行的位运算

~   按位取反
&   按位与
|   按位或
^   按位异或
>>  位右移
<<  位左移
=end

# 随机数
p Random.rand #返回比1小的浮点小数
p Random.rand(100) #参数为正整数的时候返回0-参数的随机数
p Random.rand(100)

# 计数
ary = []
10.times do |i| #循环N次 0-(n-1)
    ary << i
end
p ary

ary1 = []
2.upto(10) do |i|
    ary1 << i
end
p ary1

ary2 = []
10.downto(2) do |i|
    ary2 << i
end
p ary2

ary3 = []
2.step(10, 3) do |i|
    ary << i
end

# 近似误差值
a = 0.1 + 0.2
b = 0.3
p [a, b]
p a == b
