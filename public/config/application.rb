require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PvWebsite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.cache_store = :dalli_store, 11211, { namespace: 'player', pool_size: 10 }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Refinery::Core::Engine.after_inclusion do
	  Refinery::Resource # force autoload
	  ::Dragonfly.app(:refinery_resources).response_header('Content-Disposition', nil)
	end
  end
end
