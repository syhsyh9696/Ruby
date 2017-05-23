# encoding:utf-8
require 'benchmark'

class TurboHash
    attr_reader :table

    def initialize
        @table = []
    end

    def [](key)
        find(key).last
    end

    def find(key)
        @table.find do |entry|
            key == entry.first
        end
    end

    def []=(key, value)
        if entry = find(key)
           entry[1] = value 
        else
            @table << [key, value]
        end
    end
end

legacy = Hash.new
turbo = TurboHash.new

def set_and_find(target)
    key = rand
    target[key] = rand
    target[key]
end

Benchmark.bm do |x|
    x.report("Legacy Hash: ") { 10000.times { set_and_find(legacy) } }
    x.report("Turbo  Hash: ") { 10000.times { set_and_find(turbo) } }
end
