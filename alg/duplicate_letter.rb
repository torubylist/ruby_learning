def duplicate(str)
  str.scan(/(\w)(?=(?!.*\1.*\1)).*\1/i)
end
puts duplicate('aabb')

