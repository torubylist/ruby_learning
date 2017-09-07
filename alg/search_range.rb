def search_range(nums, target)
  result = []
  return [-1,-1] if nums.nil? || target.nil? || nums.empty?
  low = 0
  high = nums.size - 1
  while(low <= high) do
    mid = low + (high -low)/2
    if nums[mid] >= target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  if (low < nums.size && nums[mid] == target)
    result << low
  end
  high = nums.size - 1 
  while(low <= high) do
    mid = low + (high - low)/2
    if nums[mid] <= target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  result.push(high)
end
nums = [5,6,7,8,8,9]
target = 8
p search_range(nums,8) ##[3,4]
