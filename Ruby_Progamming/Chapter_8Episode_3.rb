hpter# encoding: utf-8
# 限制方法的调用
class AccTest
	def pub
		p "pub is a public method"
	end

	public :pub

	def priv
		p "priv is a private method"
	end

	private :priv

	public #不指定参数的时候后面的方法全部被定义成public
	private #同上
end

class Point
	attr_accessor :x, :y #定义存储器
	protected :x=, :y= #把x, y设置为protected

	def initialize(x=0.0, y=0.0)
		@x, @y = x, y
	end
end
