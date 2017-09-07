class Queue
  def initialize
    @array = []
  end


  def length
    @store.size
  end

  def enqueue x
    @array.push(x)
  end

  def dequeue
    @array.shift
  end
end

