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

File.open("name", "r") do |io|
    while line = io.gets
        line.chomp!
        p line
    end
end
