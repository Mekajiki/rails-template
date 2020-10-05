require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators.system_tests = nil

    config.time_zone = "Tokyo"

    config.paths["config/routes.rb"] = Dir[Rails.root.join("config/routes/*.rb")]

    # Translation fileを分割する為。
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]

    # Helperのscopeを限定する。
    config.action_controller.include_all_helpers = false

    # Scaffold時にjbuilderのfileを生成しない。残念ながらcontrollerの
    # `format.json`の部分は手で消すしかない（jbuilderがtemplateを上書きしてるか
    # ら、上書きしないにはgemごと消すしかない模様）。
    config.generators do |g|
      g.jbuilder false
    end
  end
end
