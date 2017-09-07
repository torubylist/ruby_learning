def find_minimum_in_rotated_sorted_nums(nums)
  if nums.size == 0
    return 0
  elsif nums.size == 1
    nums.size == 1
    return nums[0]
  elsif nums.size == 2
    return nums.min
  end
  start = 0
  stop  = nums.size - 1 
  
  while start < stop - 1 do
    if nums[start] < nums[stop]
      return nums[start]
    end
    mid  =  start + (stop - start) / 2
    if nums[tmp] > nums[start]
      start = mid
    elsif nums[tmp]< nums[start]
      stop = mid
    end
  end
  return [nums[start],nums[stop]].min
end
