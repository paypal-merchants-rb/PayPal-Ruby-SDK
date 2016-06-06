require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

refresh_token = "J5yFACP3Y5dqdWCdN3o9lNYz0XyR01IHNMQn-E4r6Ss38rqbQ1C4rC6PSBhJvB_tte4WZsWe8ealMl-U_GMSz30dIkKaovgN41Xf8Sz0EGU55da6tST5I6sg3Rw"

tokeninfo = PayPal::SDK::OpenIDConnect::DataTypes::Tokeninfo.create_from_third_party_refresh_token(refresh_token)
access_token = tokeninfo.access_token

# more attribute available in tokeninfo
logger.info tokeninfo.to_hash


@invoice = Invoice.new({
  "merchant_info" => {
    "email" => "developer@sample.com",
    "first_name" => "Dennis",
    "last_name" => "Doctor",
    "business_name" => "Medical Professionals, LLC",
    "phone" => {
      "country_code" => "001",
      "national_number" => "5032141716"
    },
      "address" => {
      "line1" => "1234 Main St.",
      "city" => "Portland",
      "state" => "OR",
      "postal_code" => "97217",
      "country_code" => "US"
    }
  },
  "billing_info" => [ { "email" => "example@example.com" } ],
  "items" => [
    {
      "name" => "Sutures",
      "quantity" => 100,
      "unit_price" => {
        "currency" => "USD",
        "value" => 5
      }
    }
  ],
  "note" => "Medical Invoice 16 Jul, 2013 PST",
  "payment_term" => {
    "term_type" => "NET_45"
  },
  "shipping_info" => {
    "first_name" => "Sally",
    "last_name" => "Patient",
    "business_name" => "Not applicable",
    "phone" => {
      "country_code" => "001",
      "national_number" => "5039871234"
    },
    "address" => {
      "line1" => "1234 Broad St.",
      "city" => "Portland",
      "state" => "OR",
      "postal_code" => "97216",
      "country_code" => "US"
    }
  }
}.merge( :token => access_token )
)

if @invoice.create
  logger.info "Invoice[#{@invoice.id}] created successfully"
else
  logger.error @invoice.error.inspect
end
