#!/usr/bin/ruby
n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
brr = Array.new
(0...n).each do |i|
  brr.push(arr[i])
end
p brr
brr.reverse.each do |b|
  print b, ' '
end
