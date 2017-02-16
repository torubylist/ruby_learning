def compress_string(str)
  arr = str.split('')
  i = 0
  n = 1
  str1 = ''
  while( i < str.size ) do
    i += 1
    if arr[i] == arr[i-1]
      n       += 1
    else
      if n == 1
        str1 += arr[i-1]
      else   
        str1 += "#{n}" + arr[i-1]
      end
      n     = 1
    end
  end
  str1
end
puts compress_string('abbcccabb')
puts compress_string('efgl')
puts compress_string('ppppppppppp')
