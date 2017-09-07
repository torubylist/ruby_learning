def simply(str)
  h = {}
  num = 0
  if !str.start_with?('-')
    str.unshift('+')
  end
  while str != '' do
    m = str.match(/([+-]*\d*[a-z]*)/)
    s = m[1]
    n = s.match(/([+-]*\d*)([a-z]*)/)
    if n[1] == '-'
      v = '-1'
    elsif n[1] == '+'
      v = '1'
    else
      v = n[1]
    end
    num  += n[1].to_i if n[2].nil?
    k = n[2].split('').sort.join('')
    if h.has_key?(k)
      h[k] += v.to_i
    else
      h[k]  = v.to_i
    end
    str = str.sub(m[1],'')
  end
  res = h.sort.inject('') {|s,(k,v)| 
      if v > 1
        s << "+#{v}#{k}"
      elsif v == 1
        s << "+#{k}"
      elsif v == 0
        s
      elsif v == -1
        s << "-#{k}"
      else
        s << "#{v}#{k}"
      end
  }
  res.unshift('num') if num != 0
  res.sub!('+','') if res.start_with?('+')
  res
end

require 'test/unit'
class TestSimply < Test::Unit::TestCase

  def test_simply
    assert_equal(simply('-x+2xy+3yx+4y+10xyzs+6x+7'),'7+5x+4y+5xy+10xyzs')
  end
end

