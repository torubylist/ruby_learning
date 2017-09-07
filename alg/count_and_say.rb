def count_and_say(n)
  return '1' if n == 1
  str     = count_and_say(n-1)
  len     = str.size
  count   = 1
  s       = ''
  (0...len).each do |i|
    if str[i] == str[i+1]
      count += 1
    else
      s    += count.to_s + str[i]
      count = 1
    end
  end
  return s
end
puts count_and_say(3)
puts count_and_say(6)
puts count_and_say(7)
