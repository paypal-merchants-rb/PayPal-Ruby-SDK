require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@authorization = Authorization.find("5RA45624N3531924N")
@capture = @authorization.capture({
  :amount => {
    :currency => "USD",
    :total => "4.54" },
  :is_final_capture => true })

if @capture.success? # Return true or false
  logger.info "Capture[#{@capture.id}]"
else
  logger.error @capture.error.inspect
end
