require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Miniblog2
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
  end
end

config.generators do |g|
  g.helper false
  g.test_framework :rspec,
                   routing_specs: false,
                   request_specs: false,
                   view_specs: false
end
