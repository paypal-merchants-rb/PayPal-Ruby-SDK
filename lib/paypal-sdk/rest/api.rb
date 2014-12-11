require 'paypal-sdk-core'

module PayPal
  module SDK
    module REST
      class API < Core::API::REST
#        include Services

        def initialize(environment = nil, options = {})
          super("", environment, options)
        end

        class << self
          def user_agent
            @user_agent ||= "PayPalSDK/PayPal-Ruby-SDK #{VERSION} (#{sdk_library_details})"
          end
        end

      end
    end
  end
end

