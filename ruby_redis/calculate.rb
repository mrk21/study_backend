require 'bundler'
Bundler.require
require 'active_support/all'

redis = Redis.new
redis.select 1
redis.flushdb

size_before = redis.info['used_memory'].to_i

redis.pipelined do
  redis.hmset "daily:count", *(1..31).map{|d| [d, 10**3]}
  redis.hmset "daily:size" , *(1..31).map{|d| [d, 10**8]}
  redis.hmset "host:count" , *10.times.map{|i| ['localhost', 10**4]}
  redis.hmset "host:size"  , *10.times.map{|i| ['localhost', 10**9]}
end

size_after = redis.info['used_memory'].to_i

include ActiveSupport::NumberHelper

puts number_to_human_size(size_before)
puts number_to_human_size(size_after)
puts number_to_human_size(size_after - size_before)
