redis = Redis.new
Redis.current = Redis::Namespace.new('rails-app', redis: redis)
