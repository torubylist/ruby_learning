#!/usr/bin/ruby
ski = gets.strip.to_i
animals = Array.new
(0...5).each do |i|
  animals.push(gets.strip)
end
brr = Array.new
animals.each_with_index{|item,index| brr.push("#{index}:#{item}")}
p brr[ski..-1]

