# encoding: utf-8
# Time类和Date类

p Time.new
sleep 1 #等待一秒
p Time.now

t = Time.now
p t
p t.year
p t.month
p t.day
p t.zone
#其他关于时间的方法名在P281

t1 = Time.mktime(2014, 5, 30, 12,1,12)
p t1
