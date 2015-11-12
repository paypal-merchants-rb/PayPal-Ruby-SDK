# #GetPayment Sample
# This sample code demonstrates how you can retrieve
# the details of a payment resource.
# API used: /v1/payments/payment/{payment-id}
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Retrieve the payment object by calling the
  # `find` method
  # on the Payment class by passing Payment ID
  @payment = Payment.find("PAY-6BB05346FG6727110KYZEGNQ")
  logger.info "Got Payment Details for Payment[#{@payment.id}]"
  updated_payment = {
      :op=> "replace",
      :path=> "/transactions/0/amount",
      :value=> {
      :total=> "40.00",
      :currency=> "BRL",
      :details=> {:shipping=>"25.00", :subtotal=>"15.00"}
    }
  }
  patch_request = Patch.new(updated_payment)
  @payment.update(updated_payment)

rescue ResourceNotFound => err
  # It will throw ResourceNotFound exception if the payment not found
  logger.error "Payment Not Found"
end