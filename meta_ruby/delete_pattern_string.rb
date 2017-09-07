def delete_pattern_string(str1,pattern)
  if str1 == '' || pattern == ''
    return 'no right string or pattern'
  end
  h = Hash.new(0)
  pattern.split('').each do |s|
    h[ s.ord - 'a'.ord ] += 1
  end
  index = 0
  str1.split('').each do |s| 
    if s == '' || h[ s.ord - 'a'.ord ] == 0
      str1[index] = s
      index += 1
    end
  end
  return str1[0...index]
end
puts delete_pattern_string('welcome to astede','aeiou')
puts delete_pattern_string('welcome to astede','')
