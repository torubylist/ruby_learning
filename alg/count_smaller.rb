require 'benchmark'
def count_smaller(nums)
  len = nums.length
  new_nums = Array[]
  (0...len).each do |i|
    #num = nums[i]
    num = i +1
    new_num = 0
    (num...len).each do |j|
      if nums[j] < nums[i] then
        new_num += 1
      else
        next
       end
     end
    new_nums.push(new_num)
   end
  new_nums
end
nums =  Array[5,2,6,1]
puts count_smaller(nums).inspect
Benchmark.bmbm do |b|
  b.report 'running time' do
    count_smaller(nums).inspect
  end 
end  


