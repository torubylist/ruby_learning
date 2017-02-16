#!/usr/bin/ruby
sum = 0
puts (1..6).reduce(0){|i| sum + (1..i).reduce(1,:*)}

