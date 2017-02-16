#!/usr/bin/ruby
s  = gets.chomp
t  = gets.chomp
h1 = Hash.new(0)
h2 = Hash.new(0)
s.split('').each do |ch|
  h1[ch] += 1
end
t.split('').each do |c|
  h2[c] += 1
end
puts h2 == h1
