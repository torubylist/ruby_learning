##find the number whose count more than half of the size
#def find_more_than_half_number(nums)
#  nums.group_by{|x| x}.map{|k,v| return k if v.count > nums.size/2 }
#end
#
#def find_more_than_half_number(nums)
#  nums.sort[nums.size/2]
#end

def find_more_than_half_number(nums)
  candidate = nums[0]
  count = 1
  (1...nums.size).each do |i|
    if count == 0
      candidate = nums[i]
      count = 1
    else
      if candidate == nums[i]
        count += 1
      else
        count -= 1
      end
    end
  end
  candidate
end
nums = [1,1,2,3,3,4,3,3,3]
p find_more_than_half_number(nums)
