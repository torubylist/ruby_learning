#Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

#Note: Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c) The solution set must not contain duplicate triplets.

def 3sum(array)
  new_arr = array.sort  ##default ascend sort
  size = array.size
  result = []
  (0...size-2).each do |i|
    j = i + 1
    k = size -1
    while (j <  k) do
      sum = new_arr[i]  + new_arr[j] + new_arr[k]
      if sum  < 0
        j += 1
      elsif sum > 0 
        k -= 1
      else
        result.push(new_arr[i], new_arr[j], new_arr[k])
        j += 1
        k -= 1
      end
      while j < k && new_arr[j-1] == new_arr[j] do
        j += 1
      end
      while j < k && new_arr[k+1] == new_arr[k] do
        k -= 1
      end
    end
    while (i < size - 1) && new_arrj[i] == new_arr[i+1] do
      i += 1
    end
  end
end
