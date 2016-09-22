require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@templates = Templates.get_all( :fields => "all" )
logger.info "Fetched all templates"
