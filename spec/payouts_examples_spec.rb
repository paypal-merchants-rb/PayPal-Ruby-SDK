require "spec_helper"

describe "Payouts", :integration => true do

  PayoutAttributes = {
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
  }

  it "create payout sync" do
    payout = PayPal::SDK::REST::Payout.new(PayoutAttributes)
    expect(payout.create).to be_truthy
  end
end
