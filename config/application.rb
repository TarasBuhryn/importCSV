# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ImportCSV
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone                      = 'Kyiv'
    config.active_record.default_timezone = :local
  end
end
