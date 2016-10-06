# encoding: utf-8
# 参数不确定的方法
def foo(*args)
	p args #不确定数量的参数都会被传递到一个数组当中
end
foo(1, 2 ,3)

def foo2(arg, *args) #至少指定一个参数
	p arg
	p args
end
foo2(1, 2, 3)

def foo3(a, *b, c) #"*变量名"只能在参数中定义一次
	p [a, b, c]
end
foo3(1, 2, 3, 4, 5)