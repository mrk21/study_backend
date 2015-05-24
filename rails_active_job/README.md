# Rails Active Job

## Running this projejct

1. Run `bundle install` command
1. Run `redis-server` command
1. Run `bundle exec sidekiq` command
1. Run `bundle exec rails s` command
1. Run `tail -f log/development.log` command
1. Run `curl http://localhost:3000/start/run -X POST -d ''` command

## Memo

You must add settings shown below to your `spec_helper.rb` in order to use `ActiveJob::TestHelper`:

```ruby
require 'active_support/test_case'

RSpec.configure do |config|
  config.include ActiveJob::TestHelper
  config.include ActiveSupport::Testing::TimeHelpers
end
```

## See

* [\[Ruby on Rails\]Active Job – Sidekiqを使ってのJobの実行 ｜ Developers.IO](http://dev.classmethod.jp/server-side/ruby-on-rails/ruby-on-rails_active-job-sidekiq/)
* [Rails - sidekiqの使い方 - Qiita](http://qiita.com/nysalor/items/94ecd53c2141d1c27d1f)
* [Macosx に Redis をインストールする｜misc｜@OMAKASE](http://www.omakase.org/misc/macosx_redis.html)
* [RSpec で Active Job のテストを書く - milk1000cc's blog](http://milk1000cc.hatenablog.com/entry/2015/05/15/175113)
* [A Guide to Testing Rails Applications — Ruby on Rails Guides](http://edgeguides.rubyonrails.org/testing.html#testing-jobs)
* [ActiveJob::TestHelper](http://api.rubyonrails.org/classes/ActiveJob/TestHelper.html)
* [test_help.rb](http://api.rubyonrails.org/files/railties/lib/rails/test_help_rb.html)
