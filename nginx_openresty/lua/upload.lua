local template = require "resty.template"
local upload = require "resty.upload"
local cjson = require "cjson"

local method = ngx.req.get_method()

if method == 'GET' then
  ngx.header.content_type = 'text/html'
  
  local handle = io.popen('ls tmp/upload', 'r')
  local content = handle:read("*all")
  handle:close()
  
  local files = {}
  if content ~= nil then
    for f in string.gmatch(content, '%S+') do
      table.insert(files, f)
    end
  end
  
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
      <li><a href="/upload/files/{{ f }}">{{ f }}</a></li>
    {% end %}
    </ul>
  ]], { files = files })
  
elseif method == 'POST' then
  local chunk_size = 5
  local form, err = upload:new(chunk_size)
  
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
    end
    
    if typ == 'body' then
      file:write(res)
    end
    
    if typ == "eof" then
      file:close()
      break
    end
    
  end
  
  ngx.redirect '/upload'
end
