require 'paypal-sdk-rest'
require './runner.rb'
require "securerandom"

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@webhook = Webhook.new({
    :url => "https://www.yeowza.com/paypal_webhook_"+SecureRandom.hex(8),
    :event_types => [
        {
            :name => "PAYMENT.AUTHORIZATION.CREATED"
        },
        {
            :name => "PAYMENT.AUTHORIZATION.VOIDED"
        }
    ]
})

begin
  @webhook = @webhook.create
  logger.info "Webhook[#{@webhook.id}] created successfully"
rescue ResourceNotFound => err
  logger.error @webhook.error.inspect
end
