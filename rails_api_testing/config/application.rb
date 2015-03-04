require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module RailsApiTesting
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    
    config.generators do |g|
      g.test_framework :rspec,
        routing_specs: false,
        controller_specs: false
    end
  end
end
