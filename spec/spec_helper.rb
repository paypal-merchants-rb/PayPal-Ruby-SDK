require 'bundler/setup'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

Bundler.require :default, :test
PayPal::SDK::Core::Config.load(File.expand_path('../config/paypal.yml', __FILE__), 'test')

require 'paypal-sdk-rest'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

# Set logger for http
http_log = File.open(File.expand_path('../log/http.log', __FILE__), "w")
Payment.api.http.set_debug_output(http_log)

RSpec.configure do |config|
  config.filter_run_excluding :integration => true
  config.filter_run_excluding :disabled => true
  # config.include PayPal::SDK::REST::DataTypes
end
