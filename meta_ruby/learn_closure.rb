#array = [1,2,3,4]
#array.collect! do |n|
#  n ** 2
#end
##puts array.inspect
class Array
#  def iterate!
#    self.each_with_index do |n,i|
#      self[i] = yield(n)
#    end
#  end
#  def iterate!(&code)
#    self.each_with_index do |n,i|
#      self[i] = code.call(n)
#    end
#    puts code.class
#  end
  def iterate!(code)
    self.each_with_index do |n,i|
      self[i] = code.call(n)
    end
  end
end

brray = [1,2,3,4]
#brray.iterate! do |n|
#  n ** 2
#end
def power(n)
  n ** 2
end
#brray.iterate!(lambda {|n| n ** 2})
brray.iterate!(method(:power))
puts brray.inspect
