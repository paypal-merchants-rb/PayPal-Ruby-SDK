# Stub objects for REST
# Auto generated code

require 'uuidtools'

require 'paypal-sdk-core'

module PayPal::SDK
  module REST
    module DataTypes

      class DataType < Core::API::DataTypes::Base
        attr_accessor :error
        attr_writer   :header, :request_id

        def header
          @header ||= {}
        end

        def request_id
          @request_id ||= UUIDTools::UUID.random_create.to_s
        end

        def http_header
          { "PayPal-Request-Id" => request_id.to_s }.merge(header)
        end

        def success?
          @error.nil?
        end

        def merge!(values)
          @error = nil
          super
        end

        def self.load_members
        end
      end

      class Resource < DataType
      end

      class EnumType < Core::API::DataTypes::Enum
      end

      class Refund < Resource
        def self.load_members
          object_of :id, String
          object_of :create_time, String
          object_of :update_time, String
          object_of :state, String
          object_of :amount, Amount
          object_of :sale_id, String
          object_of :capture_id, String
          object_of :parent_payment, String
          object_of :description, String
          array_of :links, Link
        end

        include RequestDataType

        class << self
          def find(refundid)
            raise ArgumentError.new("refundid required") if refundid.to_s.strip.empty?
            url = sprintf("v1/payments/refund/%s", refundid.to_s.strip)
            response = api.get(url)
            new(response)
          end
        end
      end



      class Resource < DataType
        def self.load_members
        end
      end



      class Amount < Resource
        def self.load_members
          object_of :total, String
          object_of :currency, String
          object_of :details, AmountDetails
        end
      end



      class AmountDetails < Resource
        def self.load_members
          object_of :subtotal, String
          object_of :tax, String
          object_of :shipping, String
          object_of :fee, String
        end
      end



      class Link < Resource
        def self.load_members
          object_of :href, String
          object_of :rel, String
          object_of :method, String
        end
      end



      class Payment < Resource
        def self.load_members
          object_of :id, String
          object_of :create_time, String
          object_of :update_time, String
          object_of :state, String
          object_of :intent, String
          object_of :payer, Payer
          array_of :transactions, Transaction
          object_of :redirect_urls, RedirectUrls
          array_of :links, Link
        end

        include RequestDataType

        class << self
          def all(options = {})
            url = "v1/payments/payment"
            response = api.get(url, options)
            PaymentHistory.new(response)
          end
        end

        def create()
          url = "v1/payments/payment"
          response = api.post(url, self.to_hash, self.http_header)
          self.merge!(response)
          success?
        end

        class << self
          def find(paymentid)
            raise ArgumentError.new("paymentid required") if paymentid.to_s.strip.empty?
            url = sprintf("v1/payments/payment/%s", paymentid.to_s.strip)
            response = api.get(url)
            new(response)
          end
        end

        def execute(payment_execution)
          raise ArgumentError.new("id required") if self.id.to_s.strip.empty?
          url = sprintf("v1/payments/payment/%s/execute", self.id.to_s.strip)
          payment_execution = PaymentExecution.new(payment_execution) unless payment_execution.is_a? PaymentExecution
          response = api.post(url, payment_execution.to_hash, payment_execution.http_header)
          self.merge!(response)
          success?
        end
      end



      class Payer < Resource
        def self.load_members
          object_of :payment_method, String
          object_of :payer_info, PayerInfo
          array_of :funding_instruments, FundingInstrument
        end
      end



      class PayerInfo < Resource
        def self.load_members
          object_of :email, String
          object_of :first_name, String
          object_of :last_name, String
          object_of :payer_id, String
          object_of :shipping_address, Address
          object_of :phone, String
        end
      end



      class Address < Resource
        def self.load_members
          object_of :line1, String
          object_of :line2, String
          object_of :city, String
          object_of :state, String
          object_of :postal_code, String
          object_of :country_code, String
          object_of :type, String
          object_of :phone, String
        end
      end



      class FundingInstrument < Resource
        def self.load_members
          object_of :credit_card, CreditCard
          object_of :credit_card_token, CreditCardToken
        end
      end



      class CreditCard < Resource
        def self.load_members
          object_of :id, String
          object_of :valid_until, String
          object_of :state, String
          object_of :payer_id, String
          object_of :type, String
          object_of :number, String
          object_of :expire_month, String
          object_of :expire_year, String
          object_of :cvv2, String
          object_of :first_name, String
          object_of :last_name, String
          object_of :billing_address, Address
          array_of :links, Link
        end

        include RequestDataType

        def create()
          url = "v1/vault/credit-card"
          response = api.post(url, self.to_hash, self.http_header)
          self.merge!(response)
          success?
        end

        class << self
          def find(creditcardid)
            raise ArgumentError.new("creditcardid required") if creditcardid.to_s.strip.empty?
            url = sprintf("v1/vault/credit-card/%s", creditcardid.to_s.strip)
            response = api.get(url)
            new(response)
          end
        end
      end



      class CreditCardToken < Resource
        def self.load_members
          object_of :credit_card_id, String
          object_of :payer_id, String
        end
      end



      class Transaction < Resource
        def self.load_members
          object_of :amount, Amount
          object_of :payee, Payee
          object_of :description, String
          object_of :item_list, ItemList
          array_of :related_resources, SubTransaction
        end
      end



      class Payee < Resource
        def self.load_members
          object_of :merchant_id, String
          object_of :email, String
          object_of :phone, String
        end
      end



      class ItemList < Resource
        def self.load_members
          array_of :items, Item
          object_of :shipping_address, ShippingAddress
        end
      end



      class Item < Resource
        def self.load_members
          object_of :name, String
          object_of :sku, String
          object_of :price, String
          object_of :currency, String
          object_of :quantity, String
        end
      end



      class ShippingAddress < Address
        def self.load_members
          object_of :recipient_name, String
        end
      end



      class SubTransaction < Resource
        def self.load_members
          object_of :sale, Sale
          object_of :authorization, Authorization
          object_of :refund, Refund
          object_of :capture, Capture
        end
      end



      class Sale < Resource
        def self.load_members
          object_of :id, String
          object_of :create_time, String
          object_of :update_time, String
          object_of :state, String
          object_of :amount, Amount
          object_of :parent_payment, String
          array_of :links, Link
        end

        include RequestDataType

        class << self
          def find(saleid)
            raise ArgumentError.new("saleid required") if saleid.to_s.strip.empty?
            url = sprintf("v1/payments/sale/%s", saleid.to_s.strip)
            response = api.get(url)
            new(response)
          end
        end

        def refund(refund)
          raise ArgumentError.new("id required") if self.id.to_s.strip.empty?
          url = sprintf("v1/payments/sale/%s/refund", self.id.to_s.strip)
          refund = Refund.new(refund) unless refund.is_a? Refund
          response = api.post(url, refund.to_hash, refund.http_header)
          Refund.new(response)
        end
      end



      class Authorization < Resource
        def self.load_members
          object_of :id, String
          object_of :create_time, String
          object_of :update_time, String
          object_of :state, String
          object_of :amount, Amount
          object_of :parent_payment, String
          array_of :links, Link
        end
      end



      class Capture < Resource
        def self.load_members
          object_of :id, String
          object_of :create_time, String
          object_of :update_time, String
          object_of :state, String
          object_of :amount, Amount
          object_of :parent_payment, String
          object_of :authorization_id, String
          object_of :description, String
          array_of :links, Link
        end
      end



      class RedirectUrls < Resource
        def self.load_members
          object_of :return_url, String
          object_of :cancel_url, String
        end
      end



      class PaymentExecution < Resource
        def self.load_members
          object_of :payer_id, String
          array_of :transactions, Amount
        end
      end



      class PaymentHistory < Resource
        def self.load_members
          array_of :payments, Payment
          object_of :count, Integer
          object_of :next_id, String
        end
      end





      constants.each do |data_type_klass|
        data_type_klass = const_get(data_type_klass)
        data_type_klass.load_members if defined? data_type_klass.load_members
      end

    end
  end
end
