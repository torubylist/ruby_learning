class Stack

  def initialize
    @store = []
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end
  
  def push x
    @store.push(x)
  end
end
