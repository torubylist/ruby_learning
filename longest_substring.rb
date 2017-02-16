#!/usr/bin/ruby
num = gets.strip.to_i
arr = gets.strip.split(" ").map(&:to_i)
sum = 0
max = 0
i = 0
while(i < num) do
  sum += arr[i]
  if sum < 0
    sum = 0
  end
  max = sum if sum > max
  i += 1
end
puts max
