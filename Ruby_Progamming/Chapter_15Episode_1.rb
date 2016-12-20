# encoding: utf-8
# 散列

h1 = {"a"=>"b", "c"=>"d"}
p h1["a"]

h2 = {a: "b", c:"d"} #用符号可以作为键值
p h2

h3 = Hash.new("3") #默认参数 不指定键值的时候默认值
h4 = Hash.new("")
p h3["not_key"]
p h4["not_key"]

# 获取键值
h = Hash.new
h["R"] = "Ruby"
p h.fetch("R")
p h.fetch("P", " (undef) ") #对fetch方法指定第二个参数 该参数如果散列不存在指定的键值返回
