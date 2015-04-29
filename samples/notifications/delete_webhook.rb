require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  @webhook = RunSample.run('notifications/get_webhook.rb', '@webhook')

  if @webhook.delete
    logger.info "Webhook[#{@webhook.id}] deleted successfully"
  else
    logger.error "Unable to delete Webhook[#{@webhook.id}]"
    logger.error @webhook.error.inspect
  end
rescue ResourceNotFound => err
  logger.error "Webhook Not Found"
end
