require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

    # Get webhooks event types
    @webhooks_events = WebhookEvent.search(10, "2013-03-06T11:00:00Z", "2013-04-06T11:00:00Z")

    logger.info "List Webhook Events:"
    @webhooks_events.events.each do |event|
        logger.info " -> Webhook Event Name[#{event.name}]"
    end

rescue ResourceNotFound => err
    logger.error "Webhook Events not found"
end