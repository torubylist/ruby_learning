#!/usr/bin/ruby
num = gets.strip.to_i
arr =Array.new
(0...num).each do |i|
  arr.push(gets.strip)
end
arr.each do |a|
  brr = Array.new
  crr = Array.new
  i = 0
  while (i < a.length) do
    brr.push(a[i]) if i.even?
    crr.push(a[i]) if i.odd?
    i += 1
  end
  s = brr.join('') + ' ' + crr.join('')
  puts s 
end
