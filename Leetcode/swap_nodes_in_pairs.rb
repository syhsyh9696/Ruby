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
# @return {ListNode}
def swap_pairs(head)
    return head if head.nil? || head.next.nil?

    h = ListNode.new(0)
    h.next = head

    n = h
    while n.next && n.next.next
        n1, n2, n3 = n, n.next, n.next.next

        n2.next = n3.next
        n3.next = n2
        n1.next = n3

        n = n2
    end

    h.next
end
