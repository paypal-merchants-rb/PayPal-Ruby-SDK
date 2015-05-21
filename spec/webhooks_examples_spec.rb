require "spec_helper"
require "securerandom"

describe "Webhooks", :integration => true do

  webhookAttributes = {
    :url => "https://www.yeowza.com/paypal_webhook_"+SecureRandom.hex(8),
    :event_types => [
        {
            :name => "PAYMENT.AUTHORIZATION.CREATED"
        },
        {
            :name => "PAYMENT.AUTHORIZATION.VOIDED"
        }
    ]
  }

  it "create webhook" do
    $webhook = PayPal::SDK::REST::Webhook.new(webhookAttributes)
    expect($webhook.create).to be_truthy
  end

  it "get webhook" do
    $result = PayPal::SDK::REST::Webhook.get($webhook.id)
    expect($result).to be_a PayPal::SDK::REST::Webhook
    expect($result.id).to eql $webhook.id
  end

  it "get all webhooks" do
    $webhooks_list = PayPal::SDK::REST::Webhook.all()
    expect($webhooks_list.webhooks.length).not_to be_nil
  end

  it "get subscribed webhook event types" do
    $webhook_event_types = PayPal::SDK::REST::Webhook.get_event_types($webhook.id)
    expect($webhook_event_types.event_types.length).to eql $webhook.event_types.length
  end

  it "delete webhook" do
    expect($webhook.delete).to be_truthy
  end
end
