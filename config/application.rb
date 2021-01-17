require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SuperPlan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru

    config.action_mailer.smtp_settings = {
      user_name: ENV['RAILS_MAILER_SMTP_USERNAME'],
      password: ENV['RAILS_MAILER_SMTP_PASSWORD'],
      domain: 'gmail.com',
      address: 'smtp.gmail.com',
      port: '587',
      authentication: 'login',
      enable_starttls_auto: true
    }

    dirs = Dir.glob("#{Rails.root}/config/locales/**/**/*")
    config.i18n.load_path += dirs.select { |load_path| File.file?(load_path) }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
