require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  @webhook = RunSample.run('notifications/create.rb', '@webhook')

  # Get Payout Batch Status
  @webhook_event_types = Webhook.get_event_types(@webhook.id)
  logger.info "List Webhook Subscribed Events:"
  @webhook_event_types.event_types.each do |event|
    logger.info " -> Webhook Event Name[#{event.name}]"
  end

rescue ResourceNotFound => err
  logger.error "Webhook Events not found"
end
