local template = require "resty.template"
ngx.header.content_type = 'text/html'
template.render("index.html", { message = "Hello, World!" })
