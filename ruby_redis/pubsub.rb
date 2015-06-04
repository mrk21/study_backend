# @see: [redis-rb/pubsub.rb at master · redis/redis-rb](https://github.com/redis/redis-rb/blob/master/examples/pubsub.rb)
require 'bundler'
Bundler.require

puts <<-EOS
To play with this example use redis-cli from another terminal, like this:
  $ redis-cli publish one hello
Finally force the example to exit sending the 'exit' message with:
  $ redis-cli publish two exit
EOS

redis = Redis.new

trap(:INT) { puts; exit }

begin
  redis.subscribe(:one, :two) do |on|
    on.subscribe do |channel, subscriptions|
      puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
    end
    
    on.message do |channel, message|
      puts "##{channel}: #{message}"
      redis.unsubscribe if message == "exit"
    end
    
    on.unsubscribe do |channel, subscriptions|
      puts "Unsubscribed from ##{channel} (#{subscriptions} subscriptions)"
    end
  end
rescue Redis::BaseConnectionError => error
  puts "#{error}, retrying in 1s"
  sleep 1
  retry
end
