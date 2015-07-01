local http = require 'socket.http'
local ltn12 = require 'ltn12'

opts = arg

if #arg == 0 then
  opts = {'--output=utfTerminal'}
end

http.request({
  url = 'http://127.0.0.1/busted?opts=' .. table.concat(opts, ' '),
  sink = ltn12.sink.simplify(function(chunk)
    if chunk then
      io.write(chunk)
      io.flush()
      return true
    else
      return false
    end
  end)
})
