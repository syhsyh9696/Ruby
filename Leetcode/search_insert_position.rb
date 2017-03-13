# encoding:utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def search_insert(nums, target)
    return nums.index(target) if nums.include?(target)

    nums << target
    nums.sort.index(target)
end

---
    
def search_insert(nums, target)
    (0..(nums.size - 1)).bsearch{ |i| nums[i] >= target } || nums.size
end
