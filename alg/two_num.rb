def two_sum(nums,target)
  len = nums.length
  (0...len).each do |i|
    if nums[i] > target then
      next
    end
    num2 = i + 1
    (num2...len).each do |j|
      if nums[j]  > target then
        next
      end
      sum = nums[i] + nums[j]
      if sum == target then
        index1 = i + 1
        index2 = j + 1
        puts "index1=#{index1},index2=#{index2}"
        new_nums = Array[index1,index2]
        return new_nums
      else
        next
      end
    end
  end
end
nums = Array[3,5,19,14,32]
target = 19
puts two_sum(nums,target).inspect
