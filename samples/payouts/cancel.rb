require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  # Create a Single Synchronous Payout with Invalid (Unclaimable Email Address)
  @payout_batch = RunSample.run('payouts/createSync.rb', '@payout_batch')

  # Cancel the item
  @payout_item_detail= PayoutItem.cancel(@payout_batch.items[0].payout_item_id)
  logger.info "Cancelled Unclaimed Payout with Item ID [#{@payout_item_detail.payout_item_id}]"

rescue ResourceNotFound => err
  logger.error "Payout Item could not be cancelled"
end
