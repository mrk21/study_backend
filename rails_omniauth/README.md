# Rails omniauth

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Create `config/settings.local.yml` file and edit as shown below:
```yaml
twitter:
  consumer_key: 'your app consumer key:'
  consumer_secret: 'your app consumer secret'
facebook:
  app_key: 'your app key'
  app_secret: 'your app secret'
```
1. Run `bundle exec rails s` command
1. Open [localhost:3000](http://localhost:3000/) by your browser

## Memo

### Facebook App

You must add the site URL and domains shown below:

* `Settings -> Basic -> App Domains`: `localhost`
* `Settings -> Basic -> Website -> Site URL`: `http://localhost:3000/`

In addition, you must enable `Settings -> Advanced -> OAuth Settings -> Embedded browser OAuth Login` setting.

## See

* [intridea/omniauth](https://github.com/intridea/omniauth)
* [arunagw/omniauth-twitter](https://github.com/arunagw/omniauth-twitter)
* [mkdynamic/omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)
* [RailsでOmniauthを使ってTwitterログインする - Qiita](http://qiita.com/hilotter/items/628fd54785d3c892d048)
* [Facebook login with multiple domains - Stack Overflow](http://stackoverflow.com/questions/12296180/facebook-login-with-multiple-domains)
