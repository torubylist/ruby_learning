class Fixnum

  def my_times &block
    i = 0
    while i < self
      yield(i)
      i += 1
    end
    return self
  end

end

p 5.my_times{|x| puts "hello #{x}"}
p 5.my_times{ puts "hello "}
