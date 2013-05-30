require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@authorization = Authorization.find("6CR34526N64144512")

if @authorization.void # Return true or false
  logger.info "Void an Authorization[#{@authorization.id}]"
else
  logger.error @authorization.error.inspect
end

