##分析：非简单的全排列问题（跟全排列的形式不同,abc全排列的话，只有6个不同的输出）。 本题可用递归的思想，设置一个变量表示已输出的个数，然后当个数达到字符串长度时，就输出。
#def letter_permutation(str)
#  size = str.size
#  result = Array.new
#  dfs(result,'',str,size,0)
#  return result
#end
#def dfs(result,s,str,size,pos)
#  if pos == size
#    result << s
#    return
#  end
#  (0...size).each do |i|
#    s1 = s.dup
#    s1 += str[i]
#    dfs(result,s1,str,size,pos + 1)
#  end
#end
##p letter_permutation('ab')
#p letter_permutation('abc')
#

#1、已知字符串里的字符是互不相同的，现在任意组合，比如abc，则输出a，b, c,ab，
#ac,bc,abc编程按照字典序输出所有的组合。
def letter_permutation(str)
  return if str.nil?
  res    = Array.new
  (1..str.size).each do |i|
    result = Array.new
    dfs(str,i,res,result)
  end
  res
end

def dfs(str,m,res, result)
  if m == 0
    res.push(result.join(''))
    return
  end
  if str.nil? || str.empty?
    return
  end
  result.push(str[0])
  dfs(str[1..-1], m - 1, res, result)
  result.delete_at(-1)
  dfs(str[1..-1], m, res, result)
end
p letter_permutation('abc')
#1、已知字符串里的字符是互不相同的，现在任意组合，比如abc，则输出abc，acb, bac，
#bca，cab,cba编程按照字典序输出所有的组合。
#def letter_permutation(str)
#  result = []
#  len    = str.size
#  book   = Array.new(len,0)
#  new_str = ''
#  dfs(0,new_str,str,result,book)
#  result
#end
#def dfs(step, s, str, result, book)
#  if step == str.size
#    result << s
#    return
#  end
#  (0...str.size).each do |i|
#    if book[i] == 0
#      new_s   = s.dup
#      new_s  += str[i]
#      book[i] = 1
#      dfs(step+1,new_s,str,result,book)
#      book[i] = 0
#    end
#  end
#  return
#end
#p letter_permutation('abc')
#问题3：打靶问题。一个射击运动员打靶，靶一共有10环，连开10 枪打中90环的可能性有多少？
#     思路：这道题的思路与字符串的组合很像，用递归解决。一次射击有11种可能，命中1环至10环，或脱靶。
#     参考代码：
#def dfs(step, sum)
#  if sum < 0 || step * 10 < sum
#    return
#  end
#  if step == 0 
#    if sum == 0
#      @total += 1
#    end
#    return
#  end
#  (0..10).each do |i|
#    #new_arr   = arr.dup
#    #new_arr.push << i
#    dfs(step-1, sum-i)
#  end
#end
#@total = 0
#dfs(10,99)
#p @total
