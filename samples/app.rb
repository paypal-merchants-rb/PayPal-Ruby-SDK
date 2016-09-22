# Configure Bundler
require 'bundler/setup'
require './runner.rb'

Bundler.require :default, :sample


class App < Sinatra::Application
  enable :sessions

  get '/' do
    haml :index
  end

  get "/payment/all" do
    @payment_history  = RunSample.run("payment/all.rb", "@payment_history")
    haml :display_hash, :locals => {
      :header => "Got #{@payment_history.count} matching payments",
      :display_hash => @payment_history }
  end

  get "/payment/find" do
    @payment = RunSample.run("payment/find.rb", "@payment")
    haml :display_hash, :locals => {
      :header => "Retrieving Payment: #{@payment.id}",
      :display_hash => @payment }
  end

  get "/payment/create_with_paypal" do
    @payment, @redirect_url = RunSample.run("payment/create_with_paypal.rb", "[ @payment, @redirect_url ]")
    session[:payment_id] = @payment.id
    redirect @redirect_url
  end

  get "/payment/execute" do
    ENV["PAYMENT_ID"] = session[:payment_id]
    ENV["PAYER_ID"]   = params["PayerID"]
    @payment = RunSample.run("payment/execute.rb", "@payment")
    haml :display_hash, :locals => {
      :header => "Execute Payment: #{@payment.id}",
      :display_hash => @payment }
  end

  [ 'create_with_credit_card', 'create_with_credit_card_token' ].each do |name|
    get "/payment/#{name}" do
      @payment = RunSample.run("payment/#{name}.rb", "@payment")
      haml :display_hash, :locals => {
        :header => "Create Payment: #{@payment.id}",
        :display_hash => @payment }
    end
  end

  get "/sale/find" do
    @sale = RunSample.run("sale/find.rb", "@sale")
    haml :display_hash, :locals => {
      :header => "Retrieving sale: #{@sale.id}",
      :display_hash => @sale }
  end

  get "/sale/refund" do
    @refund = RunSample.run("sale/refund.rb", "@refund")
    haml :display_hash, :locals => {
      :header => "Refunding sale: #{@refund.sale_id}",
      :display_hash => @refund }
  end

  get "/credit_card/find" do
    @credit_card = RunSample.run("credit_card/find.rb", "@credit_card")
    haml :display_hash, :locals => {
      :header => "Retrieving credit card: #{@credit_card.id}",
      :display_hash => @credit_card }
  end

  get "/credit_card/delete" do
      @credit_card = RunSample.run("credit_card/delete.rb", "@credit_card")
      haml :display_hash, :locals => {
        :header => "Deleted credit card: #{@credit_card.id}",
        :display_hash => @credit_card }
  end

  get "/payouts/create" do
    @payout_batch = RunSample.run("payouts/create.rb", "@payout_batch")
    haml :display_hash, :locals => {
                          :header => "Created a Batch Payout: #{@payout_batch.batch_header.payout_batch_id}",
                          :display_hash => @payout_batch }
  end

  get "/payouts/createSync" do
    @payout_batch = RunSample.run("payouts/createSync.rb", "@payout_batch")
    haml :display_hash, :locals => {
                          :header => "Created a Synchronous Payout: #{@payout_batch.batch_header.payout_batch_id}",
                          :display_hash => @payout_batch
                      }
  end

  get "/payouts/get_batch_status" do
    @payout_batch = RunSample.run("payouts/get_batch_status.rb", "@payout_batch")
    haml :display_hash, :locals => {
                          :header => "Got Batch Status of: #{@payout_batch.batch_header.payout_batch_id}",
                          :display_hash => @payout_batch
                      }
  end

  get "/payouts/get_item_status" do
    @payout_item_details = RunSample.run("payouts/get_item_status.rb", "@payout_item_details")
    haml :display_hash, :locals => {
                          :header => "Got Item Status of: #{@payout_item_details.payout_item_id}",
                          :display_hash => @payout_item_details
                      }
  end
  get "/payouts/cancel" do
    @payout_item_detail = RunSample.run("payouts/cancel.rb", "@payout_item_detail")
    haml :display_hash, :locals => {
    :header => "Cancel Unclaimed Payouts of #{@payout_item_detail.payout_item_id}",
        :display_hash => @payout_item_detail
    }
  end

  get "/notifications/get_webhooks_event_types" do
    @webhooks_event_types = RunSample.run("notifications/get_webhooks_event_types.rb", "@webhooks_event_types")
    haml :display_hash, :locals => {
      :header => "Got Webhook Event Types",
        :display_hash => @webhooks_event_types
    }
  end

  get "/notifications/create" do
    @webhook = RunSample.run("notifications/create.rb", "@webhook")
    haml :display_hash, :locals => {
      :header => "Created Webhook #{@webhook.id}",
        :display_hash => @webhook
    }
  end

  get "/notifications/get_webhook" do
    @webhook = RunSample.run("notifications/get_webhook.rb", "@webhook")
    haml :display_hash, :locals => {
      :header => "Got Webhook #{@webhook.id}",
        :display_hash => @webhook
    }
  end

  get "/notifications/update_webhook" do
    @webhook = RunSample.run("notifications/update_webhook.rb", "@webhook")
    haml :display_hash, :locals => {
      :header => "Updated Webhook #{@webhook.id}",
        :display_hash => @webhook
    }
  end

  get "/notifications/get_subscribed_webhooks_event_types" do
    @webhooks_event_types = RunSample.run("notifications/get_subscribed_webhooks_event_types.rb", "@webhook_event_types")
    haml :display_hash, :locals => {
      :header => "Got webhook subscribed event types ",
        :display_hash => @webhooks_event_types
    }
  end

  get "/notifications/get_all_webhooks" do
    @webhooks_list = RunSample.run("notifications/get_all_webhooks.rb", "@webhooks_list")
    haml :display_hash, :locals => {
      :header => "Got all webhooks ",
        :display_hash => @webhooks_list
    }
  end

  get "/notifications/delete_webhook" do
    @webhook = RunSample.run("notifications/delete_webhook.rb", "@webhook")
    haml :display_hash, :locals => {
      :header => "Deleted webhook ",
        :display_hash => @webhook
    }
  end

  get "/notifications/simulate_event" do
    @resource = RunSample.run("notifications/simulate_event.rb", "@resource")
    haml :display_hash, :locals => {
      :header => "Simulated webhook event, got back resource ",
        :display_hash => @resource
    }
  end

  get "/credit_card/create" do
    @credit_card = RunSample.run("credit_card/create.rb", "@credit_card")
    haml :display_hash, :locals => {
      :header => "Saved a new credit card: #{@credit_card.id}",
      :display_hash => @credit_card }
  end

  get "/authorization/reauthorize" do
    @authorization = RunSample.run("authorization/reauthorize.rb", "@authorization")
    haml :display_hash, :locals => {
      :header => "Reauthorized an authorized payment: #{@authorization.id}",
      :display_hash => @authorization }
  end

  get "/authorization/find" do
    @authorization = RunSample.run("authorization/find.rb", "@authorization")
    haml :display_hash, :locals => {
      :header => "Retrieving an authorization payment: #{@authorization.id}",
      :display_hash => @authorization }
  end

  get "/authorization/void" do
    @authorization = RunSample.run("authorization/void.rb", "@authorization")
    haml :display_hash, :locals => {
      :header => "Void an authorized payment: #{@authorization.id}",
      :display_hash => @authorization }
  end

  get "/authorization/capture" do
    @capture = RunSample.run("authorization/capture.rb", "@capture")
    haml :display_hash, :locals => {
      :header => "Captured an authorized payment: #{@capture.id}",
      :display_hash => @capture }
  end

  get "/capture/find" do
    @capture = RunSample.run("capture/find.rb", "@capture")
    haml :display_hash, :locals => {
      :header => "Retrieving Captured Payment: #{@capture.id}",
      :display_hash => @capture }
  end

  get "/capture/refund" do
    @refund = RunSample.run("capture/refund.rb", "@refund")
    haml :display_hash, :locals => {
      :header => "Refunding Captured Payment: #{@refund.sale_id}",
      :display_hash => @refund }
  end

  get "/invoice/create" do
   @invoice = RunSample.run("invoice/create.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "Created a new invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice/get" do
   @invoice = RunSample.run("invoice/get.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "get a new invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice/get_all" do
   @invoices = RunSample.run("invoice/get_all.rb", "@invoices")
       haml :display_hash, :locals => {
         :header => "Get all Invoices",
         :display_hash => @invoices }
  end

  get "/invoice/send" do
    @invoice = RunSample.run("invoice/send_invoice.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "Sent the invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice/remind" do
    @invoice = RunSample.run("invoice/remind.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "Remind already sent invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice/cancel" do
    @invoice = RunSample.run("invoice/cancel.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "Cancelled invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice/third_party" do
    @invoice = RunSample.run("invoice/third_party_invoice.rb", "@invoice")
       haml :display_hash, :locals => {
         :header => "Created third Party invoice: #{@invoice.id}",
         :display_hash => @invoice }
  end

  get "/invoice_template/create" do
   @template = RunSample.run("invoice_template/create.rb", "@template")
      haml :display_hash, :locals => {
        :header => "Created invoice template: #{@template.template_id}",
        :display_hash => @template }
  end

  get "/invoice_template/get" do
   @template = RunSample.run("invoice_template/get.rb", "@template")
      haml :display_hash, :locals => {
        :header => "Get invoice template: #{@template.template_id}",
        :display_hash => @template }
  end

  get "/invoice_template/get_all" do
   @templates = RunSample.run("invoice_template/get_all.rb", "@templates")
      haml :display_hash, :locals => {
        :header => "Get all templates",
        :display_hash => @templates }
  end

  get "/invoice_template/update" do
   @template = RunSample.run("invoice_template/update.rb", "@template")
      haml :display_hash, :locals => {
        :header => "Updated template : #{@template.template_id}",
        :display_hash => @template }
  end

  get "/invoice_template/delete" do
   @template = RunSample.run("invoice_template/delete.rb", "@template")
      haml :display_hash, :locals => {
        :header => "Deleted template : #{@template.template_id}",
        :display_hash => @template }
  end

  Dir["payment/*", "sale/*", "credit_card/*", "authorization/*", "invoice/*", "invoice_template/*", "capture/*", "payouts/*", "notifications/*"].each do |file_name|
    get "/#{file_name.sub(/rb$/, "html")}" do
      CodeRay.scan(File.read(file_name), "ruby").page :title => "Source: #{file_name}"
    end
  end

end
