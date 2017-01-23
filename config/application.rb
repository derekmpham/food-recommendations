require_relative 'boot'

require "rails"
require 'google_maps_service'
require 'instagram'
require 'dotenv'

# CONFIGURE CLIENT FOR GOOGLE MAPS GEOCODING API
# Setup global parameters
GoogleMapsService.configure do |config|
  config.key = ENV["GOOGLE_MAPS_GEOCODING_KEY"]
  config.retry_timeout = 20
  config.queries_per_second = 10
end

# Initialize client using global parameters
gmaps = GoogleMapsService::Client.new


CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
  config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoodRecommendations
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
