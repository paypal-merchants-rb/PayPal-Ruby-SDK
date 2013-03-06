# #SaleRefund Sample
# This sample code demonstrate how you can
# process a refund on a sale transaction created
# using the Payments API.
# API used: /v1/payments/sale/{sale-id}/refund
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@sale = Sale.find("7DY409201T7922549")

# Make Refund API call
# Set amount only if the refund is partial
@refund = @sale.refund({
  :amount => {
    :total => "0.01",
    :currency => "USD" } })

# Check refund status
if @refund.success?
  logger.info "Refund[#{@refund.id}] Success"
else
  logger.error "Unable to Refund"
  logger.error @refund.error.inspect
end
