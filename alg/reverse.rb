def reverse_str(str)
  n = str.size
  head = 0
  tail = n -1
  while ( head < tail ) do
    t = str[head]
    str[head] = str[tail]
    str[tail] = t
    head     += 1
    tail     -= 1
  end
  str
end

puts reverse_str('abcd')
puts reverse_str('adef')
