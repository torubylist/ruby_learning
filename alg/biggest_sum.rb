def sum(a)
  sum = 0
  max_sum = a[0]
  a.each do |e|
    if e + sum < e
      sum = e
    else
      sum = e + sum
    end
    if sum > max_sum
      max_sum = sum
    end
  end
  max_sum
end


require 'test/unit'
class TestSum < Test::Unit::TestCase

  def test_sum
    assert_equal(sum([10,-5,3,-2,9,10,-7,6]),25)
    assert_equal(sum([6,-7,4,1,-2,9]),12)
    assert_equal(sum([-1,-7,4,1,-2,-5,2,7]),9)
    assert_equal(sum([-4,-7,-2,-5]),-2)
  end
end
