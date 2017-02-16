class EnuTest

  def initialize &block
    @eb = EnuBlock.new
    yield @eb
  end

  def next
    @eb.next
  end
end

class EnuBlock

  def initialize
    @blocks = []
  end

  def << obj
    if obj.is_a?(Proc)
      @blocks << obj
    else
      @blocks << proc { obj }
    end
  end

  def next
    if @blocks.empty?
      raise 'EOF'
    else
      @blocks.shift.call
    end
  end
end


enu = EnuTest.new do |x|
  x << 1
  x << 2
  x << proc { 'hello' }
end

p enu.next
p enu.next
p enu.next
p enu.next
