# nginx openresty

## Running this projejct

1. Run `git submodule update --init`
1. Run `./install.sh` command(requires `cpanm` command)
1. Run `./run.sh` command
1. Open [localhost:8080](http://localhost:8080/) by your browser

Other than above path, there also exist on the following:

### `/redis`

Using Redis; needs to boot `redis-server` to local.

### `/conditional_internal_redirect`

Redirects internally by conditions of query of the request URL.

* Does not redirect internally: [/conditional_internal_redirect](localhost:8080/conditional_internal_redirect)
* Redirects internally: [/conditional_internal_redirect?internal_redirect](localhost:8080/conditional_internal_redirect?internal_redirect)

### `/template`

Using template engine.

---

In addition, you can execute nginx module testing by entering `prove` command.

## Memo

A version of LuaRocks corresponding to OpenResty is 2.0.x; 2.1 or later version does not support.

## See

* [openresty/openresty.org](https://github.com/openresty/openresty.org)
* [OpenResty - a fast web app server by extending nginx](http://openresty.org/)
* [Nginx Lua 拡張の OpenResty を使って見る (Redis + JSON 編) - Qiita](http://qiita.com/voluntas/items/b37aedc70058c519aa00)
* [OpenResty (nginx + lua) 逆引きメモ - Qiita](http://qiita.com/voluntas/items/e86f5fe5b8044c311583)
* [Nginx(OpenResty)でLuaを動かす＋パフォーマンス(ついでにHHVMも) - ゆっくり備忘録](http://mitsuakikawamorita.com/blog/?p=1552)
* [NginxとLuaを用いた動的なリバースプロキシでデプロイを 100 倍速くした](http://www.slideshare.net/toshi_pp/devsummit2015)
* [lua-nginx-module を使いこなす - Qiita](http://qiita.com/kz_takatsu/items/e94805a8e3cc285f9b33)

### luarocks

* [OpenResty - a fast web app server by extending nginx](http://openresty.org/#UsingLuaRocks)

### redis

* [openresty/lua-resty-redis](https://github.com/openresty/lua-resty-redis)

### template

* [bungle/lua-resty-template](https://github.com/bungle/lua-resty-template)

### test-nginx

* [Test::Nginxでnginxモジュールのテストを自動化する - Qiita](http://qiita.com/cubicdaiya/items/36e10ed35848919dc05c)
* [Test::Nginx::Socket - Socket-backed test scaffold for the Nginx C modules - metacpan.org](https://metacpan.org/pod/Test::Nginx::Socket)
