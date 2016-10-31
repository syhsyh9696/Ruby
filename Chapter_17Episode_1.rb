# encoding: utf-8
# IO类

# 文件的输入输出
=begin
r   只读模式
r+  读写模式
w   用只写模式打开文件 文件不存在就创建新的文件 文件存在就清空文件(就是把文件大小设置为0)
w+  读写模式 其余和w模式相同
a   追加模式 文件不存在就创建
a+  用读取/追加模式打开文件 文件不存在就创建新的文件
=end
# open方法也是可以的
File.open("name", "r") do |io| #用块方法传递的话可以不使用File.close()
    while line = io.gets
        line.chomp! #删除字符串末尾的换行符
        p io.lineno
        #对line的处理
    end
    p io.eof? #检查是否输入完毕
end
io.close
p io.close #用io.close可以检查是否关闭了文件
# data = File.read("name")
# 使用read方法可以一次性读取文件file的内容

# 一次性读取文件所有的内容 File.read("filename")
data = File.read("name") #Windows下不可以用这种方法读取图像等二进制数据 File#read会对换行符进行转换
