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
            @user_agent ||= "PayPalSDK/rest-sdk-ruby #{VERSION} (paypal-sdk-core #{PayPal::SDK::Core::VERSION}; ruby #{RUBY_VERSION}p#{RUBY_PATCHLEVEL}-#{RUBY_PLATFORM})"
          end
        end

      end
    end
  end
end

