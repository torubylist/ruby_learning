def calc(expr)

  tokens = expr.split(' ')
  brr    = []
  tokens.each do |t|

    if t =~ /^-?\d+\.?\d*$/
      if t =~ /\./
        brr.push t.to_f
      else
        brr.push t.to_i
      end
    elsif t == '+'
      rh = brr.pop
      lh = brr.pop
      brr.push(lh + rh)
    elsif t == '-'
      rh = brr.pop
      lh = brr.pop
      brr.push(lh - rh)
    elsif t == '*'
      rh = brr.pop
      lh = brr.pop
      brr.push(lh * rh)
    elsif t == '/'
      rh = brr.pop
      lh = brr.pop
      brr.push(lh / rh)
    else
      raise 'no such number or operation'
    end
  end

  if brr.empty?
    0
  else
    brr.last
  end
  
end

require 'test/unit'
class TestCalc < Test::Unit::TestCase

  def testcalc
    assert_equal(calc("1 2 3"), 3,"should parse numbers")
    assert_equal(calc(""), 0,"should parse empty string")
    assert_equal(calc("1 2 3.5"), 3.5,"should parse float")
    assert_equal(calc("1 3 +"), 4,"should parse addition")
    assert_equal(calc("1 3 *"), 3,"should parse multipy")
    assert_equal(calc("1 3 -"), -2,"should parse substration")
    assert_equal(calc("3 1 /"), 3,"should parse division")
    assert_equal(calc("5 1 2 + 4 * + 3 -"), 14,"should parse all numbers and operations")
  end
end
