window.onload = ->
  dispatcher = new WebSocketRails("//#{location.host}/websocket")
  channel = dispatcher.subscribe("streaming_channel")
  channel.bind "send_message", (message) ->
    console.log(message)
  setTimeout(=>
    channel.trigger "send_message", "hoge"
  , 1000)
