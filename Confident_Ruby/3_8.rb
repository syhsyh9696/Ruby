# encoding:utf-8

require_relative '3_4'

module Graphics
    module Conversions
        module_function
        def Point(*args)
            case args.first
            when Point then args.first
            when Array then Point.new(*args.first)
            when Integer then Point.new(*args)
            when String then
                Point.new(*args.first.split(":").map(&:to_i))
            else
                raise TypeError, "Can't convert #{args.inspect} to Point"
            end
        end
    end

end
