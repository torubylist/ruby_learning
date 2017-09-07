require 'benchmark'

# def find_distinct_number(args)
#   args.reduce(0){|num,a| num ^= a }
# end
# def find_distinct_number_cp(*args)
#   args.reduce(0){|num,a| num ^= a }
# end
# p find_distinct_number([2,2,3,3,5])
# iterations = 1_000_000
# Benchmark.bm do |b|
#   b.report do
#     iterations.times do 
#       find_distinct_number_cp(2,2,3,3,5)
#     end
#   end
#   b.report do
#     iterations.times do 
#       find_distinct_number([2,2,3,3,5])
#     end
#   end
# end

def find_right_index_of_1 num
  index = 0
  while num & 1 == 0 do
    num >> 1
    index += 1
  end
  return index
end

def isbit1 index,num
  num >> index
  num & 1
end

def find_distinct_two_numbers(args)
  n = args.reduce(0){ |num,a| num ^= a }
  p n
  index = find_right_index_of_1(n)
  p index
  num1 = 0
  num2 = 0

  args.each do |a|
    if isbit1(index,a) == 0
      num1 ^= a 
    else
      num2 ^= a
    end
  end
  return [num1,num2]
end

arr = [2,2,3,4,4,5,5,7]
p find_distinct_two_numbers(arr)
