require 'paypal-sdk-rest'
require './runner.rb'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  # Create a Batch Payout.
  @payout_batch = RunSample.run('payouts/get_batch_status.rb', '@payout_batch')

  # Get Payout Item Status
  @payout_item_details= PayoutItem.get(@payout_batch.items[0].payout_item_id)
  logger.info "Got Payout Item Status[#{@payout_item_details.payout_item_id}]"

rescue ResourceNotFound => err
  logger.error "Payout Item not Found"
end
