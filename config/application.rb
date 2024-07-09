require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CafeCierge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rails time:zones:all" for a list of available time zone names.
    config.time_zone = "Tokyo"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = :ja

    # Add additional load paths for your own custom dirs.
    config.eager_load_paths << Rails.root.join("lib")

    # Additional configuration can be added here
    # config.generators do |g|
    #   g.orm :active_record, primary_key_type: :uuid
    # end
  end
end