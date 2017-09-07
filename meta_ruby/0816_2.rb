#!/usr/bin/ruby
n = gets.chomp("\n").to_i
arr = Array.new
brr = Array.new
(0...n).each do |i|
  arr[i] = gets.chomp("\n")
end
n2 = gets.chomp("\n").to_i
(0...n2).each do |i|
  brr[i] = gets.chomp("\n")
end
sum = Array.new(n2,0)
i = 0
brr.each do |b|
  arr.each do |a|
    if b.eql?a
      sum[i] += 1
    end
  end
  i += 1
end
sum.each do |s|
  puts s
end
