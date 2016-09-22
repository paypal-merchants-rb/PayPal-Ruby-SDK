require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Create an invoice template
  @template = RunSample.run('invoice_template/create.rb', '@template')

  @template= Template.get(@template.template_id)
  logger.info "Got Template Details for [#{@template.template_id}]"

rescue ResourceNotFound => err
  logger.error "Template Not Found"
end
