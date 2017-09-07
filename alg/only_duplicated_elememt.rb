#!/usr/bin/ruby
nums = [1,4,4,3,5,9,8,7,10,12,11,2,6]
=begin
hash = 0
len = nums.size
(0...len).each do |i|
  hash ^= i
end
nums.each do |n|
  hash ^= n
end
puts hash
=end
sum1 = (0...nums.size).reduce(&:+)
sum2 = nums.reduce(&:+)
result = sum2 - sum1
puts result
