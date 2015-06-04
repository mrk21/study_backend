# ruby redis

## Running this projejct

1. Run `bundle install` command
1. Run `ruby test.rb` command

### pubsub test

If you want to run pubsub test script, you take steps listed below:

1. Run `ruby pubsub.rb` command
1. Run `redis-cli publish one hello` command

If you want to stop this script, you take steps listed below:

1. Run `redis-cli publish two exit` command

## See

* [antirez/redis](https://github.com/antirez/redis)
* [redisドキュメント日本語訳 — redis 2.0.3 documentation](http://redis.shibu.jp/)
* [RedisをRubyから触ってみた - ごろねこ日記](http://d.hatena.ne.jp/hiroe_orz17/20111006/1317890657)
* [Redisのサイズの測り方 - ゆっくり備忘録](http://mitsuakikawamorita.com/blog/?p=1823)
