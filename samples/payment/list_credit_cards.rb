# list all credit cards
# API docs: https://developer.paypal.com/webapps/developer/docs/api/#list-credit-card-resources
# API used: GET /v1/vault/credit-cards

require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging


# filter parameters
options = { :create_time => "2015-03-28T15:33:43Z" }

# retrieve credit card resources that match the options
credit_card_list = CreditCardList.list(options)

# print all retrieved credit cards
logger.info "credit card list: #{credit_card_list.to_hash}"
