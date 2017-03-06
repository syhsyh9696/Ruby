# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
    return [] if nums.size < 4
    nums, first, result = nums.sort, 0,[]
    
    first.upto(nums.size - 1) do |i|
        middle = 1
        middle.upto(nums.size - 1) do |j|
            next if j == i
            start, finish = 0, nums.size - 1
            while start < j && finish > j
                start += 1 if start == i
                finish -= 1 if finish == i
                next if start == finish
                temp = nums[start] + nums[j] + nums[finish]
                tempresult = [nums[start], nums[finish], nums[j], nums[i]].sort
                result << tempresult if temp == (target - nums[i]) && start != finish && finish != j && start != j
                (temp > target) ? finish -= 1 : start += 1
            end
        end
    end
    result.uniq
end
