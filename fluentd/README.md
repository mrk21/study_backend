# fluentd

## Starting

```sh
$ bundle install
$ fluentd -c ./fluent/fluent.conf -vv
```

### Fluent logger

```sh
$ bundle exec ruby fluent-logger.rb
```

### File observing

```sh
$ bundle exec ruby tail.rb
```

## Refer to

* [Fluentd | Open Source Data Collector | Unified Logging Layer](http://www.fluentd.org/)
* [Installing Fluentd Using Ruby Gem | Fluentd](http://docs.fluentd.org/articles/install-by-gem)
* [Data Import from Ruby Applications | Fluentd](http://docs.fluentd.org/articles/ruby#)
* [Fluentd v0.12 Filter プラグインの使い方と作り方 - Qiita][http://qiita.com/sonots/items/25a354b5e8aa524faeef]
