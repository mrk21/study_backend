# Rails peek

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Run `bundle exec rails s` command
1. Open [localhost:3000](http://localhost:3000/) by your browser

## Memo

peek requires responders when Rails version was 4.2. You must add the responders gem shown below to the Gemfile(see: [respond_withとクラスレベルのrespond_toの扱いについて](http://railsguides.jp/4_2_release_notes.html#respond_withとクラスレベルのrespond_toの扱いについて)):
```
gem 'responders', '~> 2.0'
```

## See

* [peek/peek](https://github.com/peek/peek)
* [Ruby on Rails 4.2 リリースノート — Rails ガイド](http://railsguides.jp/4_2_release_notes.html#respond_withとクラスレベルのrespond_toの扱いについて)
