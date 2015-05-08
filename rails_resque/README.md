# Rails resque

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Run `QUEUE=rails_resque rake environment resque:work` command
1. Run `bundle exec rails s` command
1. Run `touch log/resque.log` command
1. Run `tail -f log/resque.log` command
1. Open [localhost:3000/hello/world](http://localhost:3000/hello/world) by your browser

## See

* [resque/resque](https://github.com/resque/resque)
* [Hello World Resque (Railsにresqueを導入する) - Qiita](http://qiita.com/hilotter/items/fc432c33f5a012b87dca)
