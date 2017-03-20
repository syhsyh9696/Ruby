# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    l, r = 0, nums.size - 1
    while l < r
        mid = (r - l) / 2 + l
        return mid if nums[mid] == target

        if nums[mid] < nums[r]
            
        end
    end
end
