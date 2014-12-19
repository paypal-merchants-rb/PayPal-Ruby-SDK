module PayPal::SDK
  module REST
    module DataTypes
      class FuturePayment < Payment

        def self.exch_token(auth_code)
          if auth_code
            token = PayPal::SDK::Core::API::REST.new.token(auth_code)
            token
          end
        end

        def create(correlation_id=nil)
          path = "v1/payments/payment"
          if correlation_id != nil
            header = http_header
            header = header.merge({
              "PAYPAL-CLIENT-METADATA-ID" => correlation_id})
          end
          response = api.post(path, self.to_hash, http_header)
          self.merge!(response)
          success?
        end

      end
    end
  end
end