# frozen_string_literal: true

def ci?
  ENV["CI"] == "true"
end

REMOTE_CHROME = :remote_chrome

unless ci?
  Capybara.register_driver REMOTE_CHROME do |app|
    url = "#{ENV['REMOTE_CHROME_URL']}/wd/hub"
    caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
      "goog:chromeOptions" => {
        "args" => %w[
          no-sandbox
          headless
          disable-gpu
        ],
      },
    )
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
  end
end

SCOPE_MATCHER = %r{\A\./spec/system/(\w+)/}.freeze

RSpec.configure do |config|
  config.before(:each, type: :system, js: true) do |ex|
    driver =
      if ci?
        :selenium_chrome_headless
      else
        REMOTE_CHROME
      end

    driven_by driver

    scope = SCOPE_MATCHER.match(ex.metadata[:file_path])[1]

    server_host =
      if ci?
        "#{scope}.lvh.me"
      else
        envvar_name = "#{scope.upcase}_HOST_ALIAS"
        ENV[envvar_name]
      end

    reset_capybara(server_host)
  end
end

def reset_capybara(server_host)
  Capybara.server_host = server_host
  Capybara.server_port = 3000
  Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
end
