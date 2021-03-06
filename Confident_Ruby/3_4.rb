# encoding:utf-8

class Point
    attr_reader :x, :y, :name

    def initialize (x, y, name = nil)
        @x, @y, @name = x, y, name
    end

    def to_coords
        [x, y]
    end

    def inspect
        "#{x}:#{y}"
    end

    def to_point
        self
    end
end
