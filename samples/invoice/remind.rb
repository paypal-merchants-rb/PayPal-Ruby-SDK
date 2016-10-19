require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging


begin
    # Create an invoice
    @invoice = RunSample.run('invoice/send_invoice.rb', '@invoice')

    options = {
      "subject" => "Past due",
      "note" => "Please pay soon",
      "send_to_merchant" => true
    }

    if @invoice.remind(options)
      logger.info "Invoice[#{@invoice.id}] remind successfully"
    else
      logger.error @invoice.error.inspect
    end

rescue ResourceNotFound => err
  logger.error "Invoice Not Found"
end
