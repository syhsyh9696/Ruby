# encoding: utf-8
# 数据类
# 数据类都被定义为了Numeric的子类

=begin
Numeric------>Integer ------>Fixnum
       ------>Float   ------>Bignum
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
