def add_two_sum(arr,target)
  ##first method
  #h = Hash.new
  #arr.each_with_index{|a,i| return [h[a], i+1 ] if h[a] != nil; h[target-a] = i + 1}

  ##second method
  s = arr.size
  sta = 0
  fin = s - 1
  while ( sta < fin ) do
    sum = arr[sta] + arr[fin]
    if sum == target
      return [sta + 1,fin + 1]
    elsif sum < target
      sta += 1
    else
      fin -= 1
    end
  end
end
arr = [1,4,5,7,9,11]
puts add_two_sum(arr,15)
