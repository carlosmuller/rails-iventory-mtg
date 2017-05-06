require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iventorymtg
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Raven.configure do |config|
      config.dsn = 'https://52f0ecbb3b33425c95bb6fb87cff6be6:01c7530a49174eefaae44d3fc68178fa@sentry.io/165508'
      config.excluded_exceptions = ['ActionController::RoutingError', 'ActiveRecord::RecordNotFound']
    end
  end
end

