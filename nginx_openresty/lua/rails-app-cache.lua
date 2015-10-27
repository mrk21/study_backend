local redis = require 'resty.redis'
local red = redis:new()

red:set_timeout(1000)

local is_connecting, err = red:connect('127.0.0.1', 6379)
if not is_connecting then
  ngx.say(err)
  return
end

local params = ngx.re.match(ngx.var.request_uri, '^/rails-app/cache/([^/]+)$')
local id = params[1]

local is_existing = red:exists('rails-app:'.. id)

if is_existing == 0 then
  ngx.req.set_uri('/cache/'.. id, false)
  ngx.exec '@rails'
else
  local content = red:get('rails-app:'.. id)
  ngx.say('nginx cached!')
  ngx.say(content)
end
