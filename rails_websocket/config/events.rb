WebsocketRails::EventMap.describe do
  subscribe :streaming_channel, :to => StreamingsController, :with_method => :send_message
end
