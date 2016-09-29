require 'paypal-sdk-rest'
include PayPal::SDK::REST
require 'securerandom'
include PayPal::SDK::Core::Logging

@template = Template.new(
{
    "name" => SecureRandom.uuid,
    "default"=> true,
    "unit_of_measure"=> "HOURS",
    "template_data"=> {
        "tax_calculated_after_discount"=> false,
        "tax_inclusive"=> false,
        "note"=> "Thank you for your business",
        "logo_url"=> "https://pics.paypal.com/v1/images/redDot.jpeg",
        "items"=> [
            {
                "name"=> "Nutri Bullet",
                "quantity"=> "1",
                "unit_price"=> {
                    "currency"=> "USD",
                    "value"=> "50.00"
                }
            }
        ],
        "merchant_info"=> {
            "email"=> "jaypatel512-facilitator@hotmail.com"
        }
    },
    "settings"=> [
        {
            "field_name"=> "custom",
            "display_preference"=> {
                "hidden"=> true
            }
        },
        {
            "field_name"=> "items.date",
            "display_preference"=> {
                "hidden"=> true
            }
        }
    ]
})

if @template.create
  logger.info "Tempalte[#{@template.template_id}] created successfully"
else
  logger.error @template.error.inspect
end
