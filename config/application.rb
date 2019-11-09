# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DengenMap
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.paths.add 'lib', eager_load: true
    config.active_job.queue_adapter = :delayed_job
  end
end
