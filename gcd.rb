def gcd(a,b)
  if b == 0
    return a
  end
  puts "a,b,a%b :#{a}, #{b},#{a%b}"
  gcd(b,a%b)
end

#p gcd(6,8)

require 'test/unit'
class GcdTest < Test::Unit::TestCase

  def test_gcd
    assert_equal(gcd(10,15),5)
    assert_equal(gcd(9,13),1)
    assert_equal(gcd(9,12),3)
    assert_equal(gcd(8,12),4)
  end
end
