require 'benchmark'
require 'net/http'

def multiple_threads

  uri = URI("http://www.baidu.com")
  threads = 4.times.map do
    Thread.new do
      25.times { Net::HTTP.get(uri) }
    end
  end
  threads.map(&:join)
end

def single_thread
  uri = URI("http://www.baidu.com")
  Thread.new do
    100.times { Net::HTTP.get(uri) }
  end.join
end

Benchmark.bm do |b|

  b.report { multiple_threads }
  b.report { single_thread }
end
