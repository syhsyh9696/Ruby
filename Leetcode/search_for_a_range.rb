# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}


def search_range(nums, target)
    lbound = nums.bsearch{ |i| i >= target }
    return [-1, -1] if lbound.nil?
    return [-1, -1] if lbound != target
    
    rbound = Hash[nums.map.with_index.to_a][target]
    return [nums.index(lbound), rbound] if rbound != nil
    return [nums.index(lbound), nums.index(lbound)]
end


require 'pp'
def search_range(nums, target)
    hash = 
    pp hash
end
