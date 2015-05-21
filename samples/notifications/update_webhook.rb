require 'paypal-sdk-rest'
require './runner.rb'
require "securerandom"

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
    @webhook = RunSample.run('notifications/create.rb', '@webhook')

    # set up a patch request
    patch = Patch.new
    patch.op = "replace"
    patch.path = "/url"
    patch.value = "https://www.yeowza.com/paypal_webhook_new_url_"+SecureRandom.hex(8)

    if @webhook.update(patch)
      logger.info "Webhook[#{@webhook.id}] updated successfully"
    else
      logger.error @webhook.error.inspect
    end
rescue ResourceNotFound => err
  logger.error @webhook.error.inspect
end
