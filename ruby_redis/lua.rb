require 'pp'
require 'bundler'
Bundler.require

redis = Redis.new
redis.select 1

# Redis will raise `Redis::CommandError` exception shown below when occurred an error at `redis.call()` method of Server Side Lua:
# #<Redis::CommandError: ERR Error running script (call to f_e4cbd2c8118199ca36271d07d14b33c6505226d7): @user_script:1: @user_script: 1: Unknown Redis command called from Lua script>
begin
  pp redis.eval(<<-LUA)
    return redis.call('dddd')
  LUA
rescue => e
  pp e
end

# Server Side Lua provided by Redis can catch an error occurring at `redis.call()` method by using `pcall()` method as same as normal Lua script:
# [nil, "=[C]: -1: Unknown Redis command called from Lua script"]
pp redis.eval(<<-LUA)
  local ok, error = pcall(redis.call, 'dddd')
  return {ok, error}
LUA

# The `eval` command can specify arguments that are `KEYS` and `ARGV`.
# The both does not differ basically, but you need to use properly the both arguments in the some case.
# In the detail information of this matter, you refer to the links listed below:
# @see RedisのLua ScriptingのKEYSとARGVの違いについて調査 - ゆっくり備忘録, http://mitsuakikawamorita.com/blog/?p=2621
pp redis.eval(<<-LUA, keys: [:key1, :key2], argv: [:arg1, :arg2]) # [["key1", "key2"], ["arg1", "arg2"]]
  return {KEYS, ARGV}
LUA


# Load Lua script
pp sha1 = redis.script(:load, <<-LUA)
  return {KEYS, ARGV}
LUA

pp redis.evalsha(sha1, keys: [:key1, :key2], argv: [:arg1, :arg2]) # [["key1", "key2"], ["arg1", "arg2"]]
