threads = 3.times.map do
  Thread.new do 
    sleep 3
  end
end

puts "不用等3秒就可以看到我"
threads.map(&:join)

time = Time.now
threads = 3.times.map do
  Thread.new do 
    sleep 3
  end
end
threads.map(&:join)
puts "需要等3秒"
p Time.now - time
