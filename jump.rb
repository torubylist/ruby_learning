# def jump(n)
#   if n = 1
#     return 1
#   elsif n = 2
#     return 2
#   else
#     jump(n-2) + jump(n-1)
#   end
# end
#!/usr/bin/ruby
  n  = gets.strip.to_i
  arr = Array.new
  if n == 1
    arr[2] = 1
  end
  arr[1] = arr[0] = 1
  (2..n).each do |i|
      arr[2] = arr[1] + arr[0]
      arr[0] = arr[1]
      arr[1] = arr[2]
  end
  puts arr[2]
#end
