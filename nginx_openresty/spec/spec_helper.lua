local original_ngx_exit = ngx.exit
local original_ngx_say = ngx.say

local original_os_exit = os.exit
local original_print = print

os.exit = function(code, opt)
  if code == 0 then
    original_ngx_exit(200)
  else
    original_ngx_exit(400)
  end
end

print = function(...)
  original_ngx_say(...)
end

arg = {'--output=plainTerminal'}

return require 'busted.runner'
