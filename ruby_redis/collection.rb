require 'pp'
require 'bundler'
Bundler.require

redis = Redis.new

redis.pipelined do
  100.times do |i|
    redis.set("collection:hoge:#{i}", i)
  end
end

keys = redis.keys "collection:hoge:*"
records = redis.pipelined{ keys.each{|key| redis.get(key) } }
pp records

redis.pipelined{ keys.each{|k| redis.del(k) }}
