# encoding:utf-8

# Method: class_eval/module_eval
# 在已存在类的上下文执行一个块

def add_method_to(a_class)
    a_class.class_eval do
        def m; 'Hello'; end
    end
end

add_method_to String
p "test".m
