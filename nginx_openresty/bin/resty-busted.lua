local http = require 'socket.http'

opts = arg

if #arg == 0 then
  opts = {'--output=utfTerminal'}
end

local response = http.request('http://127.0.0.1/busted?opts=' .. table.concat(opts, ' '))
io.write(response)
