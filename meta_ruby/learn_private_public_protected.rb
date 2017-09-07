class A

  def test1
    test4
  end

  def test2
    self.test4
  end

  def test3
    A.new.test4
  end

  protected
  def test4
    puts "hello,world!"
  end

  def self.test5
    puts "hello,A"
  end

end
a = A.new
a.test1
a.test2
a.test3
#a.test4
A.test5

