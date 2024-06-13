require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Xaoc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.available_locales = %i[ru en]
    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'

    dirs = Dir.glob("#{Rails.root}/config/locales/**/**/*")
    config.i18n.load_path += dirs.select { |load_path| File.file?(load_path) }
  end
end
