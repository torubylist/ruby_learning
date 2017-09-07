##find the special number which does not appears three times.all other numbers
#repeats three times.
def find_special_number(nums)
  time = Array.new(32,0)
  res  = 0
  (0...32).each do |i|
    nums.each do |num|
      time[i] += 1 if(( num & 1 << i) != 0 )
    end
    if (time[i] % 3 != 0)
      res |= 1 << i
    end
  end
  res
end
p find_special_number([3,3,3,4,4,4,5,5,5,6,6,6,2,2,2,2])
