#!/usr/bin/ruby
arr = []
(0...n).each do |i|
  arr.push(gets.strip)
end
index = []
arr.each do |a|
  len = a.length
  if a == a.reverse
    index.push(-1)
    next
  end
  (0...len).each do |i|
    str1 = a[0...i] + a[i+1..-1]
    if str1 == str1.reverse
      index.push(i)
      break
    end
  end
end
