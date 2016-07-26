class Dup
=begin
  def initialize(s)
   @s = s
  end
=end

  def duplicate(s)
    s.squeeze!
    puts s
    str = s.split('')
    s2 = str.first
    str.each do |s1|
      s2 = s2.include?(s1) ? s2 : (s2 + s1)
    end
    puts s2
  end
end

#obj = Dup.new('abbcab')
obj = Dup.new
obj.duplicate('abbcab')
