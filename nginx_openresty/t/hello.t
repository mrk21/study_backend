use Test::Nginx::Socket;

plan tests => repeat_each() * 2 * blocks();

run_tests();

__DATA__

=== TEST 1: hello.lua
--- config
  location /hello_test {
    content_by_lua_file '../../lua/hello.lua';
  }
--- request
  GET /hello_test
--- response_body
<p>Hello, OpenResty!!</p>
