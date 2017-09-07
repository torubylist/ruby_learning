#!/usr/bin/ruby
s = '002-12.34-56.78'
arr = s.split('-')
p arr
tmp = (arr[1].to_f +  arr[2].to_f) / 2
s1 = [arr[0].to_s,tmp.to_s.round(2)].join('-')
p s1
