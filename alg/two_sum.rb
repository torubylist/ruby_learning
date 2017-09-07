#Given an array of intergers, find two numbers such that they add up to a specific target number. The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2 Please note that your returned answers (both index1 and index2) are not zero-based.
#
#You may assume that each input would have exactly one solution.
#
#Input: numbers={2, 7, 11, 15}, target=9 Output: index1=1, index2=2
def two_sum(numbers,target)
  low,high = 0, numbers.size - 1
  while(low <= high) do
    sum = numbers[low] + numbers[high]
    if sum < target
      low += 1
    elsif sum > target
      high -= 1
    else
      return [low + 1, high + 1]
    end
  end
  return [-1, -1]
end
p two_sum([2,7,11,15], 18 )
