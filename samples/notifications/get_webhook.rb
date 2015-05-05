require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  @webhook = RunSample.run('notifications/create.rb', '@webhook')

  @webhook = Webhook.get(@webhook.id)
  logger.info "Got Webhook[#{@webhook.id}]"

rescue ResourceNotFound => err
  logger.error "Payout Batch not Found"
end
