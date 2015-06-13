require 'bundler'
require 'benchmark'
Bundler.require

N = 10000

$redis = Redis.new(host: '127.0.0.1', port: 6379)
$redis.select 1
$redis.flushdb

$redis.mset *(1..31).map{|d| ["count:%02d" % d, 10**3]}
$redis.hmset "count", *(1..31).map{|d| ['%02d' % d, 10**3]}

def benchmark(format, &block)
  sum = 0
  N.times do
    result = Benchmark.measure(&block)
    sum += result.real
  end
  puts format.to_s % (sum / N)
end

def benchmark_lua(format, lua_code)
  puts format.to_s % $redis.eval(<<-LUA)
    local sum = 0
    for i=1, #{N}, 1 do
      local t1 = redis.call('time')
      #{lua_code}
      local t2 = redis.call('time')
      sum = sum + (t2[2] - t1[2])
    end
    return {sum / #{N}}
  LUA
end

benchmark_lua 'lua: incr: %s', <<-LUA
  redis.call('incr', {'count:01'})
LUA

benchmark_lua 'lua: hincrby: %s', <<-LUA
  redis.call('hincrby', {'count', '01', 1})
LUA

benchmark 'tcp: incr: %s' do
  $redis.incr "count:01"
end

benchmark 'tcp: hincrby: %s' do
  $redis.hincrby "count", "01", 1
end

$redis = Redis.new(path: '/tmp/redis.sock')

benchmark 'unix sock: incr: %s' do
  $redis.incr "count:01"
end

benchmark 'unix sock: hincrby: %s' do
  $redis.hincrby "count", "01", 1
end
