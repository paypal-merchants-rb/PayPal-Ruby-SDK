require 'paypal-sdk-rest'
require 'securerandom'
require './runner.rb'

include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

@payout = Payout.new({
                         :sender_batch_header => {
                             :sender_batch_id => SecureRandom.hex(8),
                             :email_subject => 'You have a Payout!'
                         },
                         :items => [
                             {
                                 :recipient_type => 'EMAIL',
                                 :amount => {
                                     :value => '1.0',
                                     :currency => 'USD'
                                 },
                                 :note => 'Thanks for your patronage!',
                                 :sender_item_id => '2014031400023',
                                 :receiver => 'shirt-supplier-one@mail.com'
                             }
                         ]
                     })
begin
  @payout_batch = @payout.create
  logger.info "Created Payout with [#{@payout_batch.batch_header.payout_batch_id}]"
rescue ResourceNotFound => err
  logger.error @payout.error.inspect
end
