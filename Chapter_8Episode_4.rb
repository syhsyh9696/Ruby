# encoding: utf-8
# 扩展类 继承 alias undef
class String #扩展原先的String类 用于统计字符串内有多少个单字
	def count_word
		ary = self.split(/\s+/) #用空格键进行分割接收者
		return ary.size
	end
end
str = "Just a new ruby file"
p str
p "There is #{str.count_word} words in str"

class RingArray < Array 
	def [](i)
		idx = i % size
		super(idx) #调用父类的方法
	end
end
wday = RingArray[" 日 ", " 月 ", " 火 ", " 水 ", " 木 ", " 金 ", " 土 "]
p wday[6]
p wday[-1]
p wday[15]
