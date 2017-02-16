#!/usr/bin/ruby
arr = gets.chomp.split('')
num = 0
arr.each do |ch|
  if ch == '+' || ch == '-'
    next
  end
  num = 10*num + ch.to_i
end
if arr[0] == '-'
  num = 0 - num
end
puts num
