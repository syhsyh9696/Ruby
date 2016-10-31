# coding: utf-8

#数字的times方法作为循环
7.times do |i| 
	p "第 #{i+1} 次循环"
end

#for 语句特殊用法与循环 和times不一样的地方在于 可以指定开始数值和结束数值
sum = 0
for i in 1..5 #for 变量 in 开始的数值..结束的数值 do(可以省略)
	sum = sum + i #sum += i 
end
p sum

#for 语句的一般用法
names = ["Zhang Boyang", "Wu Donglin", "Wang Chunwang", "Chen Junting"]
for i in names do
	p i
end

#while 语句的用法
i = 1
while i <= 3 
	p i
	i += 1
end

#until 语句 是while语句的反 类似if和unless
i = 1
until i > 3
	p i
	i += 1
end

#each 方法将对象集合的对象逐个取出 
names.each do |temp| #对象.each do |变量|
	p temp #需要执行的操作
end

#loop 方法一直循环输出和循环控制语句一起使用
#循环控制语句 break next redo
#break跳出循环 next执行下一次循环 redo重新执行当前循环

=begin
循环语句、方法及主要用途
times方法 确定循环次数时使用
for语句 从对象元素内取出元素使用(each语法糖)
while语句 希望自由指定循环条件的时候使用
until语句 使用while语句难懂的时候
each方法 从对象取出元素的时候
loop方法 不限制循环次数时候使用	
=end