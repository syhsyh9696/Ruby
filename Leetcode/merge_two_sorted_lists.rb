# encoding:utf-8
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    return l1 || l2 unless l1 && l2
    
    l3 = result = ListNode.new(0)
    while l1 && l2
        if l1.val < l2.val
            l3.next = l1
            l1 = l1.next
        else
            l3.next = l2
            l2 = l2.next
        end
        l3 = l3.next
    end
    l3.next = l1 || l2 # 'while' may be broken if l1/l2 == nil

    result
end

def merge_two_lists_recursively(list1, list2)
    return list1 || list2 unless l1 && l2
end
