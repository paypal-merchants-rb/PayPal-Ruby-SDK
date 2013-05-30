require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  @credit_card = CreditCard.find("CARD-7LT50814996943336KESEVWA")

  if @credit_card.delete
    logger.info "CreditCard[#{@credit_card.id}] deleted successfully"
  else
    logger.error "Unable to delete CreditCard[#{@credit_card.id}]"
    logger.error @credit_card.error.inspect
  end
rescue ResourceNotFound => err
  logger.error "CreditCard Not Found"
end
