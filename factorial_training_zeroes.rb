n = 1000
p [1,2,3,4].map{|i| n / 5 ** i}.inject(:+)
