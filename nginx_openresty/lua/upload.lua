local template = require "resty.template"
local method = ngx.req.get_method()

if method == 'GET' then
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
  ]])
  
elseif method == 'POST' then
  local upload = require "resty.upload"
  local cjson = require "cjson" 
  local chunk_size = 5
  local form, err = upload:new(chunk_size)
  
  if not form then
    ngx.log(ngx.ERR, "failed to new upload: ", err)
    ngx.exit(500)
  end
  
  form:set_timeout(1000)
  
  local content = ''
  
  while true do
    local typ, res, err = form:read()
    if not typ then
      ngx.say("failed to read: ", err)
      return
    end
    
    if typ == 'body' then
      content = content .. res
    end
    
    if typ == "eof" then
      break
    end
  end
  
  ngx.header.content_type = 'text/html'
  template.render([[
    <!DOCTYPE html>
    <meta charset="UTF-8" />
    <title>uploader: uploaded file content</title>
    
    <body style="padding: 10px 20px;">
      <h1>uploaded file content</h1>
      <p>Your uploaded file content: </p>
      <pre style="background: #eee; padding: 10px; overflow: scroll;">{{ content }}</pre>
      <a href="upload">back</a>
    </body>
  ]], { content = content })
end
