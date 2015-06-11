require 'pp'
require 'bundler'
Bundler.require

redis = Redis.new

redis.pipelined do
  100.times do |i|
    k = '%02d' % i
    redis.set("collection:hoge:#{k}", i)
  end
end

keys = redis.keys("collection:hoge:*").sort
records = redis.mget keys
pp records

redis.pipelined{ keys.each{|k| redis.del(k) }}
