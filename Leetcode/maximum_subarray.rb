# encoding:utf-8
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    max = nums[0]; submax = nums[0]
    1.upto(nums.size - 1).each do |e|
        submax = 0 if submax < 0
        
        submax += nums[e]
        max = submax if max < submax
    end
    max
end
