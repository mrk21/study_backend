# xbuild

## Running this projejct

1. Run `./install.sh` command
1. Run `./tmp/ruby-2.2.2/bin/ruby -v` command

## Memo

**CAUTION**

* Do not specify a relative path the version argument of `xbuild/ruby-install` command. The reason is that the path is construed to a relative path from the xbuild directory
* Do not append the path to the xbuild directory to `PATH` environment variable because `xbuild/ruby-install` command will not work. The reason is that it will conflict `xbuild/install` command and system `install` command

## See

* [tagomoris/xbuild](https://github.com/tagomoris/xbuild)
* [本番環境でのperl/ruby/nodeのセットアップ - たごもりすメモ](http://tagomoris.hatenablog.com/entry/20130326/1364289705)
