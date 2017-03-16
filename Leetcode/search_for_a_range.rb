# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def search_range(nums, target)
    lbound = (0...nums.size).bsearch{ |i| nums[i] >= target }
    return [-1, 1] if lbound.nil?
    return [-1, 1] if lbound != target

    return [lbound, lbound + 1]
    
end
