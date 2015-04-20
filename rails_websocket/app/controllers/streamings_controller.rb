class StreamingsController < WebsocketRails::BaseController
  def send_message
    WebsocketRails[:streaming_channel].trigger "send_message", message
  end
end
