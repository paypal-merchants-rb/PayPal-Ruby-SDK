require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@capture = Capture.find("8F148933LY9388354")
@refund  = @capture.refund({
  :amount => {
    :currency => "USD",
    :total => "110.54" }
})

# Check refund status
if @refund.success?
  logger.info "Refund[#{@refund.id}] Success"
else
  logger.error "Unable to Refund"
  logger.error @refund.error.inspect
end
