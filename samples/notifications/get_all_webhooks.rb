require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

    # Get webhooks
    @webhooks_list = Webhook.all()

    logger.info "List Webhooks:"
    @webhooks_list.webhooks.each do |webhook|
        logger.info " -> Webhook Event Name[#{webhook.id}]"
    end

rescue ResourceNotFound => err
    logger.error "Webhooks not found"
end