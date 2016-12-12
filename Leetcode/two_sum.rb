# encoding: utf-8

def two_sum(nums, target)
	hashnum = nums.maps.with_index.to_h
	# Hash index is the number
	# Value is from 0 to the length of the array
	found = nums.find.with_index do |n， index|
		target_index = hashnum[target - n] and target_index != index
	end
	[nums.index[found], hashnum[target-found]].sort
end
