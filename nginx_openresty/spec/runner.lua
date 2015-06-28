local original = {
  os = {
    exit = os.exit,
  },
  io = {
    write = io.write,
    stderr = io.stderr
  },
  debug = {
    getinfo = debug.getinfo
  },
  print = print
}

local function setup()
  os.exit = function(code, _)
    error(code, 0)
  end
  
  io.write = function(...)
    ngx.print(...)
  end
  
  io.stderr = {
    write = function(self, ...)
      ngx.print(...)
    end
  }
  
  print = function(...)
    ngx.say(...)
  end
  
  debug.getinfo = function(...)
    local args = {...}
    local result = original.debug.getinfo(...)
    if args[1] == 2 and args[2] == 'Sf' then
      result.source = 'resty-busted'
    end
    return result
  end
  
  arg = {}
  local opts = ngx.req.get_uri_args().opts or ''
  
  for opt in string.gmatch(opts, '%S+') do
    table.insert(arg, opt)
  end
  
  if #arg == 0 then
    table.insert(arg, '--output=plainTerminal')
  end
end

local function terdown()
  arg = nil
  os.exit       = original.os.exit
  io.write      = original.io.write
  io.stderr     = original.io.stderr
  debug.getinfo = original.debug.getinfo
  print         = original.print
end

local runner = require 'busted.runner'

return function(...)
  local params = {...}
  if #params == 0 then
    params = {batch = true}
  end
  setup()
  local _, result = pcall(runner, params)
  result = result - 0
  terdown()
  return result
end
