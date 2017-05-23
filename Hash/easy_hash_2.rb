# encoding:utf-8
require 'benchmark'

class Node
    attr_reader :object, :next

    def initialize(o, n)
        @object = 0
        @next = n
    end
end
