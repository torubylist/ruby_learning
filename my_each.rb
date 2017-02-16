class Array

  def my_each
    i = 0
    while i < size 
      yield(self[i])
      i += 1
    end
    return self
  end


  def my_map &block
    i = 0
    x = []
    while i < size
       x << yield(self[i])
       i += 1
    end
    return x
  end
end

#p [1,2,3].my_each{|x| puts "hello #{x}"}
p [1,2,3].my_map{|x| x*10 }
