require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

	# Get webhooks event types
	@webhooks_event_types = WebhooksEventType.all()

	logger.info "List Webhook Events:"
	@webhooks_event_types.event_types.each do |event|
		logger.info " -> Webhook Event Name[#{event.name}]"
	end

rescue ResourceNotFound => err
	logger.error "Webhook Events not found"
end