#!/usr/bin/ruby
num = gets.strip.to_i
arr = Array.new
(0...num).each do |i|
  arr.push(gets.strip)
end
brr = Array.new
arr.each do |a|
  sum = 0
  i   = 0
  while i < a.length do
    if a[i+1].eql?a[i]
      sum += 1
    end
    i += 1
  end
  brr.push(sum)
end
brr.each do |b|
  puts b
end

