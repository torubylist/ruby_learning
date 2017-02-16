#!/usr/bin/ruby
num = gets.strip.to_i
arr = Array.new
(0...num).each do |i|
  arr.push(gets.strip.downcase.split("").uniq)
end
brr = arr.flatten
sum = 0
brr.uniq.each do |b|
  s = brr.count(b)
  if s == num
    sum += 1
  end
end
puts sum
