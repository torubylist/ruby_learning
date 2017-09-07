class ListNode
  attr_accessor :var, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def add_two_link(l1,l2)
  n1, n2,n3,l3,carray = l1,l2,nil,nil,0
  if n1.nil? && n2.nil?
    raise 'Empty Link'
  end
  while n1 && n2
    v1 = n1.var
    n1 = n1.next
    v2 = n2.var 
    n2 = n2.next

    sum = v1 + v2 + carry
    carry,digit = sum.divmod(10)

    n = ListNode.new(digit)
    n3 ? (n3.next = n; n3 = n ) :( n3 = n ; l3 = n3)
  end
  if n1
    n3.next = n1
  elsif n2
    n3.next = n2
  end

  n3.next = ListNode.new(carry) if carry != 0
end
