def combination_sum(arr,target)
  result = Array.new
  dfs(arr,target,result,Array.new)
  result.each {|re| re.sort! }
  result.sort
end
def dfs(array,target,result,arr)
  return if target < 0
  if target == 0
    result << arr
    return
  end
  (0...array.size).each do |i|
    arr_tmp = arr.dup
    arr_tmp << array[i]
    dfs(array[i..-1],target - array[i], result, arr_tmp)
  end
end
p combination_sum([2,3,6,7],7)
