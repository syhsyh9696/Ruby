# coding: utf-8

#数字的times方法作为循环
7.times do |i| 
	p "第 #{i+1} 次循环"
end

#for语句特殊用法与循环 和times不一样的地方在于 可以指定开始数值和结束数值
sum = 0
for i in 1..5 #for 变量 in 开始的数值..结束的数值 do(可以省略)
	sum = sum + i #sum += i 
end
p sum

#for语句的一般用法
names = ["Zhang Boyang", "Wu Donglin", "Wang Chunwang", "Chen Junting"]
for i in names do
	p i
end
