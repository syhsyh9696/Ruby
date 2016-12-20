# encoding: utf-8
# 模块_basic_Mix-in_
p Math::PI #圆周率
p Math::sqrt(2) #如果没有定义内的方法变量同名名称 引用是可以省略模块名

include Math #直接包含
p PI
p sqrt(2)

=begin
Mix-in可以解决的问题
	1.虽然两个类可具有相似的功能吗但是不想希望把他们作为相同的种类来考虑
	2.Ruby语言的特性 不允许父类的多重继承 因此无法对已经继承的类添加共通功能的时候
=end

#创建模块
module HelloModule
	Version = "1.0"

	def hello(name)
		p "Hello, #{name}"
	end

	#如果仅仅定义了方法 虽然模块内可以直接调用 但是不能以'模块名.方法名调用'
	#如果希望方法作为模块函数给外部使用 就需要module_function方法
	module_function :hello #指定hello为模块函数
end

module FooModule
	def foo
		p self
	end

	module_function :foo
end
FooModule.foo

#类与Mix-in
module ClassMethods #定义类方法的模块
	def cmethod
		"class method"
	end
end

module InstanceMethods #定义实例方法的模块
	def imethod
		"instance method"
	end
end

class Myclass
	#使用extend方法定义类方法
	extend ClassMethods
	#使用include方法定义实例方法
	include InstanceMethods
end

p Myclass.cmethod
p Myclass.new.imethod