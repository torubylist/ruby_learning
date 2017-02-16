#!/urb/bin/ruby
str = gets.strip
str = str.downcase
flag = 0
('a'..'z').each do |s|
  if !str.include?s
    flag = 1
  end
end
if flag == 1
  p 'not pangram'
else
  p 'pangram'
end
