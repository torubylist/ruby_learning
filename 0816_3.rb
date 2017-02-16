#!/usr/bin/ruby
s = gets.strip
arr = s.split('')
if ('A'..'Z').to_a.include? arr[0]
  sum = 0
else
  sum = 1
end
arr.each do |a|
  if ('A'..'Z').to_a.include?(a)
    sum += 1
  end
end
p sum
