# encoding:utf-8
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    return true if nums.size == 1
    return true if nums[0] + 1 >= nums.size
    return false if nums[0] == 0
    
    nums[0].times { nums.shift } if num[0] < nums.size   
    can_jump(nums)
end
