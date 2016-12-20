# coding: utf-8

a, b = 0, 1
p "Before"
p [a, b]
temp = a
a = b
b = temp
p "After"
p [a,b]