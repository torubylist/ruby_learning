#75、寻找直方图中面积最大的矩形
#给定直方图，每一小块的height由N个非负整数所确定，每一小块的width都为1，请找出直方图中面积最大的矩形。+
#
#如下图所示，直方图中每一块的宽度都是1，每一块给定的高度分别是[2,1,5,6,2,3]：
#
def cal_square(nums)
  stack = []
  area  = 0
  i     = 0
  while i < nums.size 
    if stack.empty? || nums[i] >= nums[stack.last]
      stack.push(i)
      i += 1
    else
      start = stack.pop
      back  = stack.last
      width = stack.empty? ? i : i - back - 1
      area  = nums[start]*width if nums[start] *width > area 
    end
  end
  return area
end
nums = [2,1,5,6,2,3]
p cal_square(nums)
