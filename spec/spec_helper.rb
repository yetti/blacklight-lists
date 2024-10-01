# frozen_string_literal: true

require_relative "./simplecov_helper"

require "rsolr"
require "engine_cart"
EngineCart.load_application!

require "rspec/rails"
require "capybara/rspec"
require "selenium-webdriver"

Capybara.javascript_driver = :headless_chrome

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << "--headless"
    opts.args << "--disable-gpu"
    opts.args << "--no-sandbox"
    opts.args << "--window-size=1280,1696"
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

require "blacklight_lists"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
