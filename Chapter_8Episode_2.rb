# encoding: utf-8
# 类方法

class << Helloworld
	def hello(name)
		p "#{name} said hello."
	end
end
Helloworld.hello("Ruby")
