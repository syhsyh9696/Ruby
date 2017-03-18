# encoding:utf-8
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def next_permutation(nums)
    return nums.reverse! if nums.size < 3
    
    n, i = nums[-1], nums.size - 1
    nums.reverse_each do |num|
        break if num < n
        n = num
        i -= 1
    end

    return nums.reverse! if i == -1

    j = nums.size - 1
    nums.reverse_each do |num|
        break if nums[i] < num
        j -= 1
    end
    
    nums[i], nums[j] = nums[j], nums[i]
    nums[(i + 1)..-1] = nums[(i + 1)..-1].reverse!
    # nums[(1 + 1)..-1] = nums[(1 + 1)..-1].sort!
    nil
end

