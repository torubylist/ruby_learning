require 'prime'
def prime(n)
  arr = Array.new
  2.upto(n).each do |i|
    #flag = 1
    #(2...i).each do |j|
      # if i % j == 0
      #   flag = 0

      #  break 
      #end
    #end
    #arr.push i if flag == 1
    arr.push i if i.prime?
  end
  arr
end
p prime(100)
