Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, Settings.twitter.consumer_key, Settings.twitter.consumer_secret
  provider :facebook, Settings.facebook.app_key, Settings.facebook.app_secret
end
