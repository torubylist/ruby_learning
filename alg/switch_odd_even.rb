def change_odd_even(nums)

  i = 0
  j = nums.size - 1
  while (i < j) do
    while (nums[i] % 2 == 1  && i < j) do
      i += 1
    end
    while (nums[j] % 2 == 0 && j > i) do
      j -= 1
    end
    nums[i],nums[j] = nums[j], nums[i]
    i += 1
    j -= 1

  end
  nums
end

nums = [2,4,6,3,7,8,10,12,9]
p change_odd_even(nums)
