# rails api testing

## Running this project

1. Run `bundle install --path=vendor/bundle` command
1. Run `./bin/rspec` command

### Using direnv

1. Run `direnv allow` command
1. Run `rspec` command

If you set `AUTODOC=1` environment variable when you run `rspec` command, `autodoc` gem will generate the API documentation for examples that specified the `autodoc: ture` option.  When `AUTODOC=1 rspec` command execution has finished, it will be generated to the `doc/api` directory.

## See

### Libraries

* [rails-api/rails-api](https://github.com/rails-api/rails-api)
* [thoughtbot/factory\_girl\_rails](https://github.com/thoughtbot/factory_girl_rails)
* [collectiveidea/json\_spec](https://github.com/collectiveidea/json_spec)
* [r7kamura/rspec-request\_describer](https://github.com/r7kamura/rspec-request_describer)
* [amatsuda/database_rewinder](https://github.com/amatsuda/database_rewinder)

### Testing

* [#348 The Rails API Gem - RailsCasts](http://railscasts.com/episodes/348-the-rails-api-gem?language=ja&view=asciicast)
* [【Rails】RSpecと三種の神器でらくちんWeb APIテスト - Qiita ](http://qiita.com/izumin5210/items/de614b5b5b2c44486e87)
* [RailsでAPI作成とAPIのテストのまとめ - Rails Webook](http://ruby-rails.hatenadiary.com/entry/20150108/1420675366)
* [Rails でつくる API のテストの書き方（RSpec + FactoryGirl） - 彼女からは、おいちゃんと呼ばれています](http://blog.inouetakuya.info/entry/2013/10/27/200111)
* [Rails API Testing Best Practices](http://matthewlehner.net/rails-api-testing-guidelines/)
* [RailsでつくるRESTful APIのrequest specを書く - それはBooks](http://hamasyou.com/blog/2014/02/17/rails-request-rspec/)
* [Autodoc - r7km/s](http://r7kamura.github.io/2013/12/01/autodoc.html)
