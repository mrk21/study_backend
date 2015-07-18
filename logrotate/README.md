# logrotate

## Running this projejct

1. Run `rake` command
1. Run `curl localhost > /dev/null` command on the container
1. Run `logrotate /etc/logrotate.conf` command on the container
1. Run `ls -l /var/log/nginx` command on the container

## See

* [タイトルとか決めてないけどこのままでもいいかもしんない: logrotateでnginxのログを1時間ごとにローテートをする](http://toshihirock.blogspot.jp/2015/01/logrotatenginx.html)
* [Dockerfile for Ubuntu 14.04 with upstart](https://gist.github.com/yosshy/cc6c479ac5b1a1ac1774)
