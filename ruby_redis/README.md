# ruby redis

## Running this projejct

1. Run `bundle install` command
1. Run `ruby benchmark.rb` command

### pubsub test

If you want to run pubsub test script, you take steps listed below:

1. Run `ruby pubsub.rb` command
1. Run `redis-cli publish one hello` command

If you want to stop this script, you take steps listed below:

1. Run `redis-cli publish two exit` command

### collection test

If you want to run record collection test script, you take steps listed below:

1. Run `ruby collection.rb` command

## See

* [antirez/redis](https://github.com/antirez/redis)
* [redisドキュメント日本語訳 — redis 2.0.3 documentation](http://redis.shibu.jp/)
* [RedisをRubyから触ってみた - ごろねこ日記](http://d.hatena.ne.jp/hiroe_orz17/20111006/1317890657)
* [Redisのサイズの測り方 - ゆっくり備忘録](http://mitsuakikawamorita.com/blog/?p=1823)

### Server Side Lua

* [RedisのLuaスクリプティング機能について « Rest Term](http://rest-term.com/archives/3038/)
* [More Transactional Redis (2) - Lua Scripting in Action - 愛と勇気と缶ビール](http://zentoo.hatenablog.com/entry/20130718/1374152848)
