require 'paypal-sdk-rest'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin

  # Create a Batch Payout.
  @payout_batch = RunSample.run('payouts/create.rb', '@payout_batch')

  # Get Payout Batch Status
  @payout_batch= Payout.get(@payout_batch.batch_header.payout_batch_id)
  logger.info "Got Payout Batch Status[#{@payout_batch.batch_header.payout_batch_id}]"

rescue ResourceNotFound => err
  logger.error "Payout Batch not Found"
end
