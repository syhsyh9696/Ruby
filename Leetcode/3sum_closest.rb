# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
BIT = 32
MAX = 2 ** (BIT - 1) - 1
def three_sum_closest(nums, target)
    nums = nums.sort
    sum, middle = 0, 1
    minsum = MAX

    middle.upto(nums.size - 1) do |i|
        start, finish = 0, nums.size - 1
        while start < i && finish > i 
            temp = nums[start] + nums[i] + nums[finish]
            return temp if temp == target
            (temp > target) ? finish -= 1 : start += 1
            minsum = temp if (minsum - target).abs > (temp - target).abs
        end
    end
    return minsum
end
