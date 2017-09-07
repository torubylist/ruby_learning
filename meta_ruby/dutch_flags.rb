#下面是问题的正规描述： 现有n个红白蓝三种不同颜色的小球，乱序排列在一起，请通过两两交换任意两个球，使得从左至右，依次是一些红球、一些白球、一些蓝球。用0表示红，1表示白，2表示蓝。
#思路：三指针方案 current_p,begin_p,end_p
#1.初始化begin_p=current_p,last_p = nums.size - 1
#2.如果current是0，则和begin交换，同时 current += 1,begin += 1
#3,如果current是1，则 current += 1
#4.如果current是2，则和last_p交换，last_p -= 1.current不动，因为你不知道交换来的是什么。如果是1，还继续和begin交换，如果是2，则继续跟last_p交换。
def dutch_flags(nums)
  current_p = begin_p  = 0
  end_p  = nums.size - 1
  while current_p < end_p
    if nums[current_p] == 0
      nums[current_p],nums[begin_p] = nums[begin_p],nums[current_p]
      current_p += 1
      begin_p   += 1
    elsif nums[current_p] == 1
      current_p += 1
    else
      nums[current_p], nums[end_p] = nums[end_p], nums[current_p]
      end_p -= 1
    end
  end
  nums
end
nums = [1,1,2,2,0,0,1,1,0,2]
p dutch_flags(nums)
