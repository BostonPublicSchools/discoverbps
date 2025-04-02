# frozen_string_literal: true

Airbrake.configure do |config|
  config.project_key = ENV['AIRBRAKE_API_KEY']
end
