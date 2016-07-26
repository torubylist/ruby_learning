class Pair < Struct.new(:first,:second)
  def same?
    inject(:==)
  end

  def add
    reduce(:+)
  end

end

a = Pair.new(5,6)
p a.same?,a.add

b = Pair.new(4,4)
p b.same?,b.add


