# rails ridgepole test

## Running this project

1. Run `bundle install` command
1. Run `bundle exec rake db:create` command
1. Run `bundle exec rake db:apply` command

If you used `direnv`, you should not need typing `bundle exec`.

## Rake tasks

### db:apply

Apply a `db/Schemafile.rb` file to the database.

### db:changes

Show database schema changes.

### db:export

Export a `db/Schemafile.rb` file from the database.

## See

* [winebarrel/ridgepole](https://github.com/winebarrel/ridgepole)
* [Railsプロジェクトの初期開発フェーズでのDBスキーマ管理を見直す - TIM Labs](http://labs.timedia.co.jp/2014/10/railsdb.html)

## Memo

See [rails squasher test](../rails_squasher/README.md#memo).
