require 'forwardable'
class Queue


  extend Forwardable
  
  def initialize
    @q = []
  end

  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  def_delegators :@q, :clear, :first, :push, :shift, :size

end

q = Queue.new
q.enq 1,2,3,4,5
puts q.inspect
q.push 6
#puts q

q.shift

while q.size > 0
  p q.deq
end

q.enq "Ruby","Perl","Python"
puts q.first
q.clear
p q.first
