require 'bundler'
require 'json'
require 'benchmark'
Bundler.require

redis = Redis.new

puts Benchmark.measure {
  5000.times do
    redis.incr 'incr'
  end
}

puts redis.get 'incr'

puts Benchmark.measure {
  5000.times do
    redis.rpush 'set', JSON.generate(
      id: rand(100),
      value: rand(100 * 1000),
    )
  end
}

puts redis.lrange('set', 0, -1)
