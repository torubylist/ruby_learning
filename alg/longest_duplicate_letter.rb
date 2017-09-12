##input 'abcddddefffffghil',output 5,f
#def longest_duplicated_letter(str)
#  return if str.nil? || str.empty?
#  max = 0
#  k   = 0
#  sum = 1
#  i   = 0
#  while i < str.size - 1 do
#    (i+1...str.size).each do |j|
#      if str[j] == str[i]
#        sum += 1
#        if sum > max
#          k = i
#          max = sum
#        end
#      else
#        sum = 1
#        i   = j
#        break
#      end
#    end
#  end
#  [max,str[k]]
#end
def longest_duplicated_letter(str)
  return if str.nil? || str.empty?
  max = 0
  k   = 0
  sum = 1
  candidate = str[0]
  (1...str.size).each do |i|
    if str[i] == candidate 
      sum += 1
      if max < sum
        k = i
        max = sum
      end
    else
      candidate = str[i]
      sum = 1
    end
  end
  [max,str[k]]
end
p longest_duplicated_letter('abcddddefghhhhh')
