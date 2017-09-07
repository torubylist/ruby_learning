require 'benchmark'
def multiple_threads
  count = 0
  threads = 4.times.map do
    Thread.new do 
      2_500_000.times{ count += 1 }
    end
  end
  threads.map(&:join)
end

def single_thread
  time = Time.now
  count = 0
  Thread.new do 
    10_000_000.times{ count += 1 }
  end.join
end

Benchmark.bm do |b|
  b.report { multiple_threads }
  b.report { single_thread }
end
