#Given an unsorted integer array, find the first missing positive integer.


#For example,
#Given [1,2,0] return 3,
#and [3,4,-1,1] return 2.

#Your algorithm should run in O(n) time and uses constant space.

def first_missing_positive(nums)
  i = 0
  while i < nums.size do
    n = nums[i]
    if n >= 1 && n <= nums.length && nums[n-1] != n
      tmp       = nums[n-1]
      nums[n-1] = n
      nums[i]   = tmp
    else
      i += 1
    end
  end
  (1..nums.size).each do |i|
    if nums[i-1] != i
      return i
    end
  end

  return nums.size + 1
end
