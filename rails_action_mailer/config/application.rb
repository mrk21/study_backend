require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsActionMailer
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      authentication: :plain,
      user_name: Settings.mailer.account.user_name,
      password: Settings.mailer.account.password,
    }
  end
end
