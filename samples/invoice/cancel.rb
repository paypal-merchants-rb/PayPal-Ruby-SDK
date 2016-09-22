require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
    # Create an invoice
    @invoice = RunSample.run('invoice/send_invoice.rb', '@invoice')

    options = {
      "subject" => "Past due",
      "note" => "Canceling invoice",
      "send_to_merchant" => true,
      "send_to_payer" => true
    }

    if @invoice.cancel(options)
      logger.info "Invoice[#{@invoice.id}] cancel successfully"
    else
      logger.error @invoice.error.inspect
    end

rescue ResourceNotFound => err
  logger.error "Invoice Not Found"
end
