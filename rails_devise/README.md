# Rails devise

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Create `config/settings.local.yml` file and edit as shown below:
```yaml
mailer:
  gmail: 
    username: 'your user name'
    password: 'your password'
  reply:
    address: 'reply address'
```
1. Run `bundle exec rails s` command
1. Open [localhost:3000](http://localhost:3000/) by your browser
1. Click "Sign up" link
1. Enter the appropriate email and password
1. Click "Sign up" button

## See

* [plataformatec/devise](https://github.com/plataformatec/devise)
* [Rails4 にて Devise でユーザー登録・ログイン認証・認可の機能を追加 | EasyRamble](http://easyramble.com/devise-on-rails.html)
* [DeviseとAuthlogicを使ってみる ｜ Developers.IO](http://dev.classmethod.jp/server-side/devise_authlogic_use/)
* [railsconfig/rails_config](https://github.com/railsconfig/rails_config)
* [rails_config gem で開発者ごとに値が異なる定数を管理する - わからん](http://d.hatena.ne.jp/kitokitoki/20121007/p1)
* [Gmail を使って Net::SMTPAuthenticationError が出力される場合の解決法 - 大学生からはじめる Web 開発](http://karur4n.hatenablog.com/entry/2015/03/07/234600)
