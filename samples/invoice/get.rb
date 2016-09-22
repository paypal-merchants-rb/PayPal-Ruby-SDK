require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Create an invoice
  @invoice = RunSample.run('invoice/create.rb', '@invoice')

  @invoice= Invoice.find(@invoice.id)
  logger.info "Got Invoice Details for Invoice[#{@invoice.id}]"

rescue ResourceNotFound => err
  logger.error "Invoice Not Found"
end
