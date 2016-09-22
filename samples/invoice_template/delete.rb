require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Create an invoice template
  @template = RunSample.run('invoice_template/create.rb', '@template')

  if @template.delete
    logger.info "Deleted invoice template : [#{@template.template_id}]"
  else
    logger.info "Deleting failed"
  end
rescue ResourceNotFound => err
  logger.error "Template Not Found"
end
