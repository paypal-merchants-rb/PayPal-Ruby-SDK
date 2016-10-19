require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
    # Create an invoice
    @invoice = RunSample.run('invoice/create.rb', '@invoice')

    if @invoice.send_invoice
      logger.info "Invoice[#{@invoice.id}] send successfully"
    else
      logger.error @invoice.error.inspect
    end
rescue ResourceNotFound => err
  logger.error "Invoice Not Found"
end
