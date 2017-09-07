#给定一个长度为N的整数数组，只允许用乘法，不能用除法，计算任意（N-1）个数的组合乘积中的最大的一组，并写出算法的时间复杂度。
#
#思路一 穷举法
#
#我们把所有可能的（N-1）个数的组合找出来，分别计算它们的乘积，并比较大小。由于总共有N个（N-1）个数的组合，总的时间复杂度为O(N^2),但显然这不是最好的思路。

#def max_substring(nums)
#  max       = - 2 ** 31
#  nums_size = nums.size
#  (0...nums_size).each do |i|
#    left = 1
#    right = 1
#    (0...i).each do |k|
#      left *= nums[k]
#    end
#    (i+1...nums_size).each do |j|
#      right *= nums[j]
#    end
#    result = left * right
#    max = result > max ? result : max
#  end
#  max
#end
#nums = [-2,3,1,7,5,-4,0,-1]
#p max_substring(nums)

#显然这不是最优的。
#P是所有数字的积。
#P==0.那么，那么必然至少有一个0.那么我们把0设为当前值。那么剩下的n-1的乘积为Q。分三种情况
#1. Q == 0. 那么就可以return 0
#2. Q < 0. 也可以return 0。
#3. Q > 0.那么return Q。
# P > 0.寻找最小正数的index。pindex。然后分别求值。
# P < 0.寻找最大负数的index。nindex，然后两边分别求值。
#上面的思路求值P，有溢出的分险。其实可以计算正数，负数，0的个数即可以判断p的正负性。
def max_substring(nums)
  return 0 if nums.empty? || nums.nil?
  p_min = 2 ** 31 - 1 ##绝对值最小的正数
  n_max = 2 ** 31 - 1 ##绝对值最小的负数
  n_count = p_count = z_count  = 0
  n_index = p_index = z_index = 0
  nums.each_with_index do |n,i|
    if n == 0
      z_count += 1
      z_index  = i
    elsif n > 0
      p_count += 1
      if n < p_min
        p_min = n
        p_index = i
      end
    else
      n_count += 1
      if n.abs < n_max.abs
        n_max = n
        n_index = i
      end
    end
  end
  if z_count > 0
    if z_count > 1
      return 0
    end
    if n_count % 2 == 0
      index = z_index #Q为正数的情况
    else
      return 0
    end
  elsif n_count % 2 == 0 #P为正数的情况，记录最小正整数index
    index = p_index
  else 
    index = n_index #P为负数的情况，记录绝对值最小负数的index
  end
  max = 1
  nums.each_with_index do |n,i|
    if i != index
      max *= n
    end
  end
  return max
end
nums = [-2,3,1,7,5,-4,0,-1]
nums = [-2,3,1,7,5,-4]
p max_substring(nums)
