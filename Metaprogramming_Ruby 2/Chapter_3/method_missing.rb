# encoding: utf-8

# 尝试调用method_missing方法 是一个私有方法 可以通过send调用
# 会产生一个异常
class Test; end
a = Test.new
a.send :method_missing, :my_method
