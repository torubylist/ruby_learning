def max_sum_string(nums)
  max = - 2 ** 31
  sum = 0
  nums.each do |n|
    sum += n
    if sum < n
      sum = n
    end
    max = sum if sum > max
  end
  return max
end
nums = [-1,2,3,-4,7,-5,-9]
nums1 = [-1,-2,-5,0,-3,-7]
p max_sum_string(nums1)
