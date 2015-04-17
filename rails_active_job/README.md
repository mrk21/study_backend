# Rails Active Job

## Running this projejct

1. Run `bundle install` command
1. Run `redis-server` command
1. Run `bundle exec sidekiq` command
1. Run `bundle exec rails s` command
1. Run `tail -f log/development.log` command
1. Run `curl http://localhost:3000/start/run -X POST -d ''` command

## See

* [\[Ruby on Rails\]Active Job – Sidekiqを使ってのJobの実行 ｜ Developers.IO](http://dev.classmethod.jp/server-side/ruby-on-rails/ruby-on-rails_active-job-sidekiq/)
* [Rails - sidekiqの使い方 - Qiita](http://qiita.com/nysalor/items/94ecd53c2141d1c27d1f)
* [Macosx に Redis をインストールする｜misc｜@OMAKASE](http://www.omakase.org/misc/macosx_redis.html)
