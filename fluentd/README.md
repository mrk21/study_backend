# fluentd

## Starting

```sh
$ bundle install
$ fluentd -c ./fluent/fluent.conf -vv
$ echo '{"json":"message"}' | fluent-cat debug.test
```

## Refer to

* [Fluentd | Open Source Data Collector | Unified Logging Layer](http://www.fluentd.org/)
* [Installing Fluentd Using Ruby Gem | Fluentd](http://docs.fluentd.org/articles/install-by-gem)
