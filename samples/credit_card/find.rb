# #GetCreditCard Sample
# This sample code demonstrates how you 
# retrieve a previously saved 
# Credit Card using the 'vault' API.
# API used: GET /v1/vault/credit-card/{id}
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Retrieve the CreditCard  by calling the
  # static `find` method on the CreditCard class,
  # and pass CreditCard ID
  @credit_card = CreditCard.find("CARD-5BT058015C739554AKE2GCEI")
  logger.info "Got CreditCard[#{@credit_card.id}]"
rescue ResourceNotFound => err
  logger.error "CreditCard Not Found"
end
