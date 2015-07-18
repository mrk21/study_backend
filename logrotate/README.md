# logrotate

## Running this projejct

1. Run `rake` command
1. Run `curl localhost > /dev/null` command on the container
1. Run `logrotate /etc/logrotate.conf` command on the container
1. Run `tree /var/log/nginx` command on the container

## See

* [タイトルとか決めてないけどこのままでもいいかもしんない: logrotateでnginxのログを1時間ごとにローテートをする](http://toshihirock.blogspot.jp/2015/01/logrotatenginx.html)
* [rsyslogを利用したログファイル作成と、logrotateを利用したログのローテーション | OXY NOTES](http://oxynotes.com/?p=6493)
* [Dockerfile for Ubuntu 14.04 with upstart](https://gist.github.com/yosshy/cc6c479ac5b1a1ac1774)
