local status = 200
local response = ''

original = {
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

os.exit = function(code, opt)
  if code ~= 0 then
    status = 400
  end
  error('exit ' .. code)
end

print = function(...)
  response = response .. table.concat({...}) .. "\n"
end

io.write = function(...)
  response = response .. table.concat({...})
end

io.stderr = {
  write = function(self, ...)
    response = response .. table.concat({...})
  end
}

function debug.getinfo(...)
  local args = {...}
  if args[1] == 2 and args[2] == 'Sf' then
    return {
      source = 'resty-busted'
    }
  else
    return original.debug.getinfo(...)
  end
end

arg = {}
local opts = ngx.req.get_uri_args().opts or ''

for opt in string.gmatch(opts, '%S+') do
  table.insert(arg, opt)
end

if #arg == 0 then
  table.insert(arg, '--output=plainTerminal')
end

local runner = require 'busted.runner'

pcall(runner, {batch = true})

ngx.status = status
ngx.print(response)
