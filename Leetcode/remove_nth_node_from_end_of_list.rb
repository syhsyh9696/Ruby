# encoding:utf-8
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    first, second = head, head

    n.times {
        first = first.next
    }
    return head.next if first.nil?

    while first.next
        first, second = first.next, second.next
    end
    second.next = second.next.next
    return head
end
