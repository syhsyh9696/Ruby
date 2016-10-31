# encoding: utf-8
#方法的定义(省略接受者的函数式方法)
def hello(name="Ruby") #用'数值=值'这样的方法定义默认值
	p "Hello, #{name}"	
end

hello()
hello("C++")

def volume(x, y, z)
	return x*y*z
end

p volume(2, 3, 4)
p volume(10, 20, 30)

#可以省略return 如果省略return的话方法最后一个语句会变成方法的返回值
def volume_test(x, y, z)
	x*y*z
end

p volume_test(10, 20, 30)

def myloop
	while true
		yield #执行块	
	end
end
num = 1
myloop do
	p "num is #{num}"
	#syntax sugar
	break if num > 100 #break 后面加条件 也可以写成 if 条件 break end 
	num *= 2
end
