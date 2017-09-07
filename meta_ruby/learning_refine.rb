module Learning
  refine String do 
    def upcase
      return 'moo'
    end
  end

end

class NewTest

  using Learning

  def thing
    "hello".upcase
  end

end

puts NewTest.new.thing
