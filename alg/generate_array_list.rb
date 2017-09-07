class ListNode

  attr_accessor :var, :next

  def self.generate(array)
    array.map!{|v| ListNode.new(v)}
    array.length.times{ |i| array[i].next = array[i+1] }
    array.first
  end

  def initialize(value)
    @val = value
    @next = nil
  end

  def to_s
    "#{@val}"
  end

  def transform
    print @val
    print ' -> ' if self.next
    self.next.transform if self.next
  end
end

#require 'test/unit'
#class ListNodeTest < Test::Unit::TestCases

  #def setup
  #  list = ListNode.generate([1,2,3])
  #end

  #def test_transform
  #  assert_equal(list.tranverse,'1 -> 2 -> 3')
  #end
#end
