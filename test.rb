class Class
  def to_proc
    proc { |x,y| new x,y}
  end
end

p [[1,'a'],[2,'b'],[3,'c']].map(&Array)
