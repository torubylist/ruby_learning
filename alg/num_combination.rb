##将1-9放入xxx + xxx = xxx的等式中，使得等式成立，一共有多少种放法。等式中，数字不能重复。
def num_combination(nums)
  book   = Array.new(9,0)
  result = Array.new
  @total = 0
  dfs(1,book, nums,result)
  @total/2
end
def dfs(step,book,nums,res)
  if step == 10
    if 100 * res[0] + 10 * res[1] + res[2] + 100*res[3] + 10*res[4] + res[5] ==
        100*res[6] + 10 *res[7] +res[8]
      p res
      @total += 1
      return
    end
  end
  (0...nums.size).each do |i|
    if book[i] == 0
      book[i] = 1
      tmp_res = res.dup
      tmp_res.push(nums[i])
      dfs(step+1,book,nums,tmp_res)
      book[i] = 0
    end
  end
end
nums = [1,2,3,4,5,6,7,8,9]
p num_combination(nums)
