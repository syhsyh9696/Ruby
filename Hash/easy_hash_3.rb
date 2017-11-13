# encoding:utf-8

class Node
  attr_reader :object, :next

  def initialize(o, n)
    @object = o
    @next = n
  end
end

class TurboHash
    STARTING_BINS = 16
    
    def initialize
        @max_density = 5
        @entry_count = 0
        @bin_count = STARTING_BINS
        @table = Array.new(@bin_count)
    end

    def grow
        @bin_count = @bin_count << 1
        new_table = Array.new(@bin_count)

        @table.each do |node|
            if node
                begin
                    new_index = index_of(node.object[0])
                    new_table[new_index] = Node.new(node.object, )
                end while node = node.next
            end
        end
    end
end
