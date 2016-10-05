require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  RunSample.run('notifications/get_webhook.rb', '@webhook')
  RunSample.run('notifications/get_webhook.rb', '@webhook')

  # Get webhooks
  @webhooks_list = Webhook.all()

  logger.info "List Webhooks:"
  @webhooks_list.webhooks.each do |webhook|
    logger.info " -> Webhook Event Name[#{webhook.id}]"
  end

rescue ResourceNotFound => err
  logger.error "Webhooks not found"
ensure
  # Clean up webhooks as not to get into a bad state
  @webhooks_list.webhooks.each do |webhook|
    webhook.delete
  end
end
