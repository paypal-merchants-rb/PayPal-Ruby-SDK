require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  @authorization = Authorization.find("7DY409201T7922549")
  logger.info "Got Authorization[#{@authorization.id}]"
rescue ResourceNotFound => err
  logger.error "Authorization Not Found"
end
