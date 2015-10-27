# nginx openresty

## Running this projejct

1. Run `git submodule update --init`
1. Run `make` command(requires `carton` and `prove` commands)
1. Run `make run` command(uses `sudo` command; you need to enter the password)
1. Open [localhost](http://localhost/) by your browser

Other than above path, there also exist on the following:

### `/redis`

Using Redis; needs to boot `redis-server` to local.

### `/conditional_internal_redirect`

Redirects internally by conditions of query of the request URL.

* Does not redirect internally: [/conditional_internal_redirect](http://localhost/conditional_internal_redirect)
* Redirects internally: [/conditional_internal_redirect?internal_redirect](http://localhost/conditional_internal_redirect?internal_redirect)

### `/template`

Using template engine.

### `/upload`

Does uploading a file and displaying the uploaded file content. it uses `lua-resty-upload` lua module.

### `/busted`

Runs the specs by busted. You can specify the busted options by the `opts` GET parameter:

```bash
$ curl http://localhost/busted?opts=--list
spec/hello_spec.lua:2: a test should succeed
spec/hello_spec.lua:6: a test should fail
spec/hello_spec.lua:10: a test should occer an error
spec/hello_spec.lua:14: a test should pend
```

In addition, if you ran `bin/resty-busted` command, it will behave as same as `busted` command:

```bash
$ bin/resty-busted
●◼✱◌
1 success / 1 failure / 1 error / 1 pending : 0.002753 seconds

Pending → spec/hello_spec.lua @ 15
a test should pend
spec/hello_spec.lua:15: pending message

Failure → spec/hello_spec.lua @ 6
a test should fail
spec/hello_spec.lua:7: Expected to be truthy, but value was:
(boolean) false

Error → spec/hello_spec.lua @ 10
a test should occer an error
spec/hello_spec.lua:11: invalid
```

However, in this case, you need to run `make run` command previously.

### `/chunked`

Makes a chunked response. You will be able to see the chunked response graphically when you ran `bin/chunked` command.

### `/set_by_lua`

Shows a value of variable set by lua.

### `/dynamic_proxy/:hostname/:path_with_query`

Proxies to `http://:hostname/:path_with_query` dynamically.

**example**

```bash
$ curl http://localhost/dynamic_proxy/qiita.com/mrk_21/items/3c35787418fbfce42103
<!DOCTYPE html><html xmlns:og="http://ogp.me/ns#"><head><meta charset="UTF-8" /><title>AdventCalendar - CMake言語の基本構造 - Qiita</title>
...
```

### `/rails-app/cache`

1. Run `cd rails-app` command
1. Run `bundle install --path=vendor/bundle` command
1. Run `bundle exec rails s`
1. Open [localhost/rails-app/cache/5](http://localhost/rails-app/cache/5) by your browser

---

In addition, you can execute nginx module testing by entering `make test` command.

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

### file uploading

* [openresty/lua-resty-upload](https://github.com/openresty/lua-resty-upload)

### test-nginx

* [Test::Nginxでnginxモジュールのテストを自動化する - Qiita](http://qiita.com/cubicdaiya/items/36e10ed35848919dc05c)
* [Test::Nginx::Socket - Socket-backed test scaffold for the Nginx C modules - metacpan.org](https://metacpan.org/pod/Test::Nginx::Socket)

### cpanm・carton・cpanfile

* [Carton - Perl module 依存マネージャー(aka Perl用 Bundler) - perldoc.jp](http://perldoc.jp/docs/modules/Carton-v1.0.12/lib/Carton.pod)
* [Big Sky :: cpanfile とは何か、なぜそれを使いたいのか](http://mattn.kaoriya.net/software/lang/perl/20130311120002.htm)
* [cpanfile - PerlアプリケーションのためにCPANの依存性を記述するためのフォーマット - perldoc.jp](http://perldoc.jp/docs/modules/Module-CPANfile-1.0001/lib/cpanfile.pod)
* [perlbrew や cpanm と carton - Qiita](http://qiita.com/hiyuzawa/items/ba32532a60f1e1353a8c)
* [hayajoのTumblr, 最近のperlbrewなアプリの開発環境について](http://hayajo.tumblr.com/post/24030128304/perlbrew)
* [Perl - Carton を使う - Qiita](http://qiita.com/bibio/items/4bf3978ede85c6996a24)
* [Carton考2014 | おそらくはそれさえも平凡な日々](http://www.songmu.jp/riji/entry/2014-02-19-carton.html)
