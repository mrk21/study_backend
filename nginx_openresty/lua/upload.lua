local template = require "resty.template"
local upload = require "resty.upload"
local cjson = require "cjson"

local method = ngx.req.get_method()

if method == 'GET' then
  local handle = io.popen('ls tmp/upload','r')
  local files = {}
  while true do
    local line = handle:read()
    if line == nil then break end
    table.insert(files, line)
  end
  handle:close()
  
  ngx.header.content_type = 'text/html'
  template.render([[
    <!DOCTYPE html>
    <meta charset="UTF-8" />
    <title>uploader</title>
    
    <h1>file uploading</h1>
    
    <form method="POST" action="upload" enctype="multipart/form-data">
      <input name="file" type="file" />
      <input type="submit" value="upload" />
    </form>
    
    <ul>
    {% for i,f in ipairs(files) do %}
      <li>
        <a href="/upload/files/{{ f }}">{{ f }}</a>
        <form method="POST" action="/upload/files/{{ f }}" style="display: inline-block;">
          <input type="submit" value="delete" />
        </form>
      </li>
    {% end %}
    </ul>
  ]], { files = files })
  
elseif method == 'POST' then
  local form, err = upload:new(100)
  if not form then
    ngx.log(ngx.ERR, "failed to new upload: ", err)
    ngx.exit(500)
  end
  form:set_timeout(1000)
  
  local file = nil
  
  while true do
    local typ, res, err = form:read()
    if not typ then
      ngx.say("failed to read: ", err)
      return
    end
    
    if typ == 'header' and res[1] == 'Content-Disposition' then
      local filename = string.match(res[2], 'filename="(.*)"')
      file = io.open('tmp/upload/' .. filename, 'w')
    elseif typ == 'body' then
      file:write(res)
    elseif typ == "eof" then
      file:close()
      break
    end
  end
  
  ngx.redirect('/upload')
end
