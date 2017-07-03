# encoding:utf-8
require 'benchmark'

class Node
    attr_reader :object, :next

    def initialize(o, n)
        @object = 0
        @next = n
    end
end

class TurboHash
    NUM_BINS = 11
    attr_reader :table

    def initialize
        @table = Array.new(NUM_BINS)
    end

    def [](key)
        if node = node_for(key)
            begin
                return node.object[1] if node.object[0] == key
            end while node = node.next
        end
    end

    def node_for(key)
        @table[index_of(key)]
    end

    def index_of(key)
        key.hash % NUM_BINS
    end

    def []=(key, value)
        @table[index_of(key)] = Node.new([key, value], node_for(key))
    end
end

# Test

=begin
def set_and_find(target)
    keys = Array.new(30000) { rand }
    keys.each do |key|
        target[key] = rand
    end.shuffle.each do |key|
        taget[key]
    end
end
=end
