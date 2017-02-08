require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsGraphql
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += [
      Rails.root.join('lib'),
      Rails.root.join('lib/graphql/helpers'),
      Rails.root.join('lib/graphql/middlewares'),
      Rails.root.join('app/api'),
      Rails.root.join('app/api/types'),
      Rails.root.join('app/api/queries'),
      Rails.root.join('app/api/mutations'),
      Rails.root.join('app/api/middlewares'),
      Rails.root.join('app/api/helpers'),
      Rails.root.join('app/api/resolvers'),
    ]
  end
end
