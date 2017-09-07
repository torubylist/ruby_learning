def max_multiple_substring(nums)
  max_end = nums[0]
  min_end = nums[0]
  max_res = nums[0]
  (1...nums.size).each do |i|
    end1     = max_end * nums[i]
    end2     = min_end * nums[i]
    max_end  = [end1,end2,nums[i]].max
    min_end  = [end1,end2,nums[i]].min
    max_res  = [max_res,max_end].max
  end
  return max_res
end

nums = [-2.5, 4, 0, 3,0.5,8, -1 ]
p max_multiple_substring(nums)
