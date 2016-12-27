# encoding: utf-8

class Lawyer
    def method_missing(method, *args)
        puts "You called: #{method} (#{args.join(sep=',')})"
        puts "(You also passed it a block)" if block.given?
    end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
    # a block
end

# Array#join(sep=$,)  返回一个字符串 通过把每个元素转换为字符串 并使用sep进行分割
# Basic_Object#block.given? 用于判断是否进行了块传递
