# # Get Details of a Sale Transaction Sample
# This sample code demonstrates how you can retrieve 
# details of completed Sale Transaction.
# API used: /v1/payments/sale/{sale-id}
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Get Sale object by passing sale id
  @sale = Sale.find("7DY409201T7922549")
  logger.info "Got Sale[#{@sale.id}]"
rescue ResourceNotFound => err
  logger.error "Sale Not Found"
end
