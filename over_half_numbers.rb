#!/usr/bin/ruby
arr = gets.strip.split(' ').map(&:to_i)
candidate = a[0]
num = 1
i = 1

while i < arr.len do
  if num == 0
    candidate = a[i]
    num = 1
  else 
    if candidate == a[i]
      num += 1
    else
      num -= 1
    end
  end
  i += 1
end
puts candidate



