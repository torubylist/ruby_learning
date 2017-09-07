def move_str(s,m,n)
  s1 = s[0..m-n-1]
  s2 = s[m-n..m]
  s3 = s1.reverse + s2.reverse
  s3.reverse
end

require 'test/unit'
class TestMoveStr < Test::Unit::TestCase

  def test_move_str
    assert_equal(move_str('ABCDEF',6,3),'DEFABC')
    assert_equal(move_str('HelloWord',9,4),'WordHello')
    assert_not_equal(move_str('HelloWord',9,4),'oWordHell')
  end
end

