if ngx.req.get_uri_args().internal_redirect then
  ngx.exec("@internal_path")
end
ngx.say("/conditional_internal_redirect")
