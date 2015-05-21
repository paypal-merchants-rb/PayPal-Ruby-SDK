require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  @webhook_event = Webhook.simulate_event(nil, "https://requestb.in/1jbk3uv1", "PAYMENT.CAPTURE.COMPLETED")

  @resource = @webhook_event.get_resource()

rescue ResourceNotFound => err
  logger.error "Payout Batch not Found"
end
