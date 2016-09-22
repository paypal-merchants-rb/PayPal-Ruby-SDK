require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Create an invoice template
  @template = RunSample.run('invoice_template/create.rb', '@template')

  @template.custom = nil
  @template.template_data.note = "Something else"

  @template.update
rescue ResourceNotFound => err
  logger.error "Template Not Found"
end
