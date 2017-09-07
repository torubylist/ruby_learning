#给定两个非常大的正整数A和B，位数在50至100之间。求C＝A+B；

#题目类别: 字符串 
#难度: 中级 
#运行时间限制: 10Sec 
#内存限制: 128MByte 
#阶段: 入职前练习 
#输入: 
#因为A和B很大，从高位到低位，以字符串的形式输入两行数字A和B。A和B的位数在50至100之间。
#
#输出: 
#以字符串形式，输出一行，表示A和B的和。
def big_nums_sum(a,b)
  m = a.size
  n = b.size
  return a if n == 0
  return b if m == 0
  max = m > n ? m : n
  result = ''
  carry = 0
  (0...max).each do |i|
    p = m - i - 1  >= 0 ? a[m-i-1].to_i : 0
    q = n - i - 1 >= 0 ? b[n-i-1].to_i : 0
    carry,k = (p + q + carry).divmod(10)
    result = k.to_s + result
  end
  return '1' + result if carry == 1
  return result
end
a = '1234'
b = '9876'
p big_nums_sum(a,b)
