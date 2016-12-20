# encoding: utf-8
# 类
ary = Array.new
p ary

str = "Hello ruby"
p ary.class #对象属于哪个类的class方法
p str.class
p ary.instance_of?(Array) #判断对象是否属于那个类
p str.instance_of?(Array)

class HelloWorld
	def initialize(myname="Ruby") #类似构造函数 new方法的参数会原封不动的传递
		@name = myname
	end

	def hello
		p "Hello world, I'm #{@name}"
	end

	def name #ruby中 对象外部不能直接访问实例变量和对实例
	         #变量赋值 必须借用这样的方法或者attr_
		@name
	end

	def name=(value) #方法名就是'name=' 看上去是赋值 其实是调用这个方法
		@name = value
	end

end
billy = HelloWorld.new("Billy")
ruby = HelloWorld.new
billy.hello
ruby.hello
p ruby.name
p billy.name
billy.name = "Wang"
p billy.name

class HelloWorld_ano
	# attr_reader :name 只读(定义name方法)
	# attr_writer :name 只写
	attr_accessor :tname #读写
	def initialize(myname="Billy")
		tname = myname
	end

	def greet
		p "Hi, I am #{name}"
		#p "Hi, I am #{self.name}" #也可以写为#{name} 如果省略了接受者 默认是self
	end

	def modify
		self.tname = "Ruby"
	end

end
test = HelloWorld_ano.new
test.greet
test.modify
test.greet
