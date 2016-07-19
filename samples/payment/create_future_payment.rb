# #Future Payment Sample
# This sample code demonstrate how you can
# create a Future Payment.
# This is a console application, so run it with `bundle exec ruby payment/create_future_payment.rb` on terminal
# API used: CREATE /v1/payments/payments
#           /v1/oauth2/token

require 'paypal-sdk-rest'
include PayPal::SDK::REST::DataTypes
include PayPal::SDK::Core::Logging


# authorization code from mobile sdk
authorization_code = ''

# correlation ID from mobile sdk
correlation_id = ''

# Initialize the payment object
payment = {
  "intent" =>  "authorize",
  "payer" =>  {
    "payment_method" =>  "paypal" },
  "transactions" =>  [ {
    "amount" =>  {
      "total" =>  "1.00",
      "currency" =>  "USD" },
    "description" =>  "This is the payment transaction description." } ] }

# exchange authorization code with refresh/access token
logger.info "Exchange authorization code with refresh/access token"
tokeninfo  = FuturePayment.exch_token(authorization_code)

# get access_token, refresh_token from tokeninfo. refresh_token can be exchanged with access token. See https://github.com/paypal/PayPal-Ruby-SDK#openidconnect-samples
access_token = tokeninfo.access_token
logger.info "Successfully retrieved access_token=#{access_token} refresh_token=#{tokeninfo.refresh_token}"

# more attribute available in tokeninfo
logger.info tokeninfo.to_hash

# Create Payments
logger.info "Create Future Payment"
future_payment = FuturePayment.new(payment.merge( :token => access_token ))
success = future_payment.create(correlation_id)

# check response for status
if success
  logger.info "future payment successfully created"
else
  logger.info "future payment creation failed"
end
