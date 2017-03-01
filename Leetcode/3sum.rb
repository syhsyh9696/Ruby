# encoding:utf-8
# @param {Integer[]} nums
# @return {Integer[][]}

def three_sum(nums)
    nums = nums.sort
    bound = (0...nums.size).bsearch{ |i| nums[i] >=  0 }
    return[] if bound.nil?
    # return[[0, 0, 0]] if nums.size == 3 && nums[0] == 0 && nums[1] == 0 && nums[2] == 0

    result = []
    0.upto(bound) do |ai|
        next if ai > 0 && nums[ai] == nums[ai - 1]
        
        subsum = -nums[ai]
        bi = ai + 1
        ci = nums.size - 1
       
        next unless subsum >= (nums[bi] || 0) * 2

        while bi < ci
            case nums[bi] + nums[ci] <=> subsum
            when -1
                bi += 1
            when 1
                ci -= 1
            when 0
                result << [nums[ai], nums[bi], nums[ci]]
                bi += 1
                bi += 1 while bi < ci && nums[bi] == nums[bi - 1]
                ci -= 1
                ci -= 1 while bi < ci && nums[ci] == nums[ci + 1]
            end
        end
    end
    result
end
