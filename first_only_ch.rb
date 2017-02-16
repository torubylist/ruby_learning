#!/usr/bin/ruby
str = gets.chomp.split('')
hash = Hash.new(0)
str.each do |ch|
  hash[ch] += 1
end
str.each do |ch|
  if hash[ch] == 1
    puts ch
    break
  end
end
