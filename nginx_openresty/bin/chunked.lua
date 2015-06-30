local http = require 'socket.http'
local ltn12 = require 'ltn12'

http.request({
  url = 'http://127.0.0.1/chunked',
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
