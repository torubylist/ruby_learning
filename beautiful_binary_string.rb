#!/usr/bin/ruby
n = gets.strip.to_i
str = gets.strip
num = 0
len = str.length - 2
i = 0
while i < len do 
  if str[i..i+2].eql?'010'
    num += 1
    i += 3
  else 
    i += 1
  end
  puts i
end
puts num
