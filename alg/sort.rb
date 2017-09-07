def quick_sort(a)
  ( x = a.pop ) ? quick_sort(a.select{|y| y <= x}) + [x] + quick_sort(a.select{|z| z>=x }) : []
end
def merge_sort(a)
  return a if a.size <= 1
  middle = a.size / 2
  left = merge_sort(a[0,middle])
  right = merge_sort(a[middle,a.size-1])
  merge(left,right)
end
def merge(l,r)
  result = []
  while l.size > 0 && r.size > 0 do
    if l.first < r.first
      result << l.shift
    else
      result << r.shift
    end
  end
  if l.size > 0
    result += l
  end
  if r.size > 0
    result += r
  end
  result
end
def bubble_sort(a)
  (a.size-2).downto(0).each do |i|
    (0..i).each do |j|
      if a[j+1] < a[j]
        t      = a[j+1]
        a[j+1] = a[j]
        a[j]   = t
      end
    end
  end
  return a
end
def select_sort(a)
  (0..a.size-1).each do |i|
    min = a[i]
    k = i
    (i+1..a.size-1).each do |j|
      if a[j] < min
        min = a[j]
        k   = j
      end
    end
    a[k],a[i] = a[i],min
  end
  return a
end
def insert_sort(a)
  a.each_with_index do |e,i|
    tmp = a[i]
    j = i - 1
    while j >= 0 do
      break if a[j] < e
      a[j+1] = a[j]
      j     -= 1
    end
    a[j+1]  = tmp
  end
end
def shell_sort(a)
  gap = a.size / 2
  while gap > 0 do
    (gap..a.size-1).each do |i|
      tmp = a[i]
      j = i - gap
      while j >= 0 do
        break if a[j] < tmp
        a[j+gap]  = a[j]
        j         = j - gap
      end
      a[j+gap] = tmp
    end
    gap = gap / 2
  end
  return a
end

require 'test/unit'
class SortTest < Test::Unit::TestCase

  def setup
    @b = [5,10,19,24,4,8,7,11]
  end
  def test_sort
    #assert_equal(shell_sort(@b), [4,5,7,8,10,11,19,24])
    #assert_equal(quick_sort(@b), [4,5,7,8,10,11,19,24])
    #assert_equal(bubble_sort(@b), [4,5,7,8,10,11,19,24])
    #assert_equal(merge_sort(@b), [4,5,7,8,10,11,19,24])
    #assert_equal(select_sort(@b), [4,5,7,8,10,11,19,24])
    assert_equal(insert_sort(@b), [4,5,7,8,10,11,19,24])
  end
end
