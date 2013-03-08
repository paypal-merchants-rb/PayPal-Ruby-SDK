# REST SDK

The PayPal REST SDK provides Ruby APIs to create, process and manage payment.

## Installation

Add this line to your application's Gemfile:

    gem 'paypal-sdk-rest'

    # gem 'paypal-sdk-core', :git => "https://github.com/paypal/sdk-core-ruby.git"
    # gem 'paypal-sdk-rest', :git => "https://github.com/paypal/rest-api-sdk-ruby.git"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-sdk-rest

## Configuration

For Rails application:

    rails g paypal:sdk:install

For other ruby application, create a configuration file(`config/paypal.yml`):

    development: &default
      client_id: EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM
      client_secret: EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM
      mode: sandbox
      # # with Proxy
      # http_proxy: http://proxy-ipaddress:3129/
      # # with CA File
      # ssl_options:
      #   ca_file: config/cacert.pem
      # # Override Endpoint
      # rest_endpoint: https://api.sandbox.paypal.com
    test:
      <<: *default
    production:
      <<: *default
      mode: live


Load Configurations from specified file:

    PayPal::SDK::Core::Config.load('spec/config/paypal.yml',  ENV['RACK_ENV'] || 'development')

Without configuration file:

    PayPal::SDK::REST.set_config(
      :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
      :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM",
      :mode => "sandbox", # "sandbox" or "live"
      :ssl_options => { } )

Override configuration:

    # Class level
    Payment.set_config( :client_id => "123" )

    # Object level
    payment.set_config( :client_id => "123" )


## Create Payment

```ruby
require 'paypal-sdk-rest'
include PayPal::SDK::REST

PayPal::SDK::REST.set_config(
  :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
  :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM",
  :mode => "sandbox" )

# Build Payment object
@payment = Payment.new({
  :intent => "sale",
  :payer => {
    :payment_method => "credit_card",
    :funding_instruments => [{
      :credit_card => {
        :type => "visa",
        :number => "4417119669820331",
        :expire_month => "11",
        :expire_year => "2018",
        :cvv2 => "874",
        :first_name => "Joe",
        :last_name => "Shopper",
        :billing_address => {
          :line1 => "52 N Main ST",
          :city => "Johnstown",
          :state => "OH",
          :postal_code => "43210",
          :country_code => "US" }}}]},
  :transactions => [{
    :amount => {
      :total => "1.00",
      :currency => "USD" },
    :description => "This is the payment transaction description." }]})

# Make API call & get response
if @payment.create
  @payment.id     # Payment Id
else
  @payment.error  # Error Hash
end
```

## Get Payment

```ruby
# Fetch Payment
payment = Payment.find("PAY-57363176S1057143SKE2HO3A")

# Get List of Payments
payment_history = Payment.all( :count => 10 )
payment_history.payments
```

## Execute Payment

```ruby
payment = Payment.find("PAY-57363176S1057143SKE2HO3A")

if payment.execute( :payer_id => "DUFRQ8GWYMJXC" )
  # Success Message
else
  payment.error # Error Hash
end
```
