# encoding: utf-8
# 类方法 类变量

class Hellocount 
	@@count = 0 #用@@开头的变量称之为类变量

	def Hellocount.count #这个方法被称作类方法
		@@count
	end

	class << Hellocount #类方法的另一种写法 Hellocount也可以换成self
		def count_ano
			@@count
		end
	end

	def initialize(myname="ruby")
		@name = myname
	end

	def hello
		@@count += 1
		p "Hello, world. I'm #{@name}"
	end
end

Xu = Hellocount.new("Zephyr")
p Hellocount.count
Xu.hello
Xu.hello
p Hellocount.count