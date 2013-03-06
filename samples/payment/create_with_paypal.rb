# #Create Payment Using PayPal Sample
# This sample code demonstrates how you can process a
# PayPal Account based Payment.
# API used: /v1/payments/payment
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

# ###Payment
# A Payment Resource; create one using
# the above types and intent as 'sale'
@payment = Payment.new({
  :intent =>  "sale",

  # ###Payer
  # A resource representing a Payer that funds a payment
  # Payment Method as 'paypal'
  :payer =>  {
    :payment_method =>  "paypal" },

  # ###Redirect URLs
  :redirect_urls => {
    :return_url => "http://localhost:3000/payment/execute",
    :cancel_url => "http://localhost:3000/" },

  # ###Transaction
  # A transaction defines the contract of a
  # payment - what is the payment for and who
  # is fulfilling it.
  :transactions =>  [ {

    # ###Amount
    # Let's you specify a payment amount.
    :amount =>  {
      :total =>  "5",
      :currency =>  "USD" },
    :description =>  "This is the payment transaction description." } ] } )

# Create Payment and return status
if @payment.create
  # Redirect the user to given approval url
  @redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
  logger.info "Payment[#{@payment.id}]"
  logger.info "Redirect: #{@redirect_url}"
else
  logger.error @payment.error.inspect
end
