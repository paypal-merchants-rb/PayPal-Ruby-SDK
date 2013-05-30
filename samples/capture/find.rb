require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  @capture = Capture.find("8F148933LY9388354")
  logger.info "Got Capture[#{@sale.id}]"
rescue ResourceNotFound => err
  logger.error "Capture Not Found"
end
