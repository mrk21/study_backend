Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, Settings.twitter.consumer_key, Settings.twitter.consumer_secret
end
