# Rails omniauth

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Create `config/settings.local.yml` file and edit as shown below:
```yaml
twitter:
  consumer_key: 'your app consumer key:'
  consumer_secret: 'your app consumer secret'
```
1. Run `bundle exec rails s` command
1. Open [127.0.0.1:3000](http://127.0.0.1:3000/) by your browser

## See

* [intridea/omniauth](https://github.com/intridea/omniauth)
* [RailsでOmniauthを使ってTwitterログインする - Qiita](http://qiita.com/hilotter/items/628fd54785d3c892d048)
