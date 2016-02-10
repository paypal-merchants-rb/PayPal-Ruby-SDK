module PayPal
  module SDK
    module Core
      module API
        autoload :Base,     "paypal-sdk/core/api/base"
        autoload :REST,     "paypal-sdk/core/api/rest"

        module DataTypes
          autoload :Base, "paypal-sdk/core/api/data_types/base"
          autoload :Enum, "paypal-sdk/core/api/data_types/enum"
          autoload :SimpleTypes,    "paypal-sdk/core/api/data_types/simple_types"
          autoload :ArrayWithBlock, "paypal-sdk/core/api/data_types/array_with_block"
        end
      end
    end
  end
end
