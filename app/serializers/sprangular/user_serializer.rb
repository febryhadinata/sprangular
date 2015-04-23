module Sprangular
  class UserSerializer < BaseSerializer
    attributes *(user_attributes | [:bill_address_id, :ship_address_id])

    has_many :completed_orders, serializer: Sprangular::LiteOrderSerializer
    has_many :addresses,        serializer: Sprangular::AddressSerializer
    has_many :payment_sources,  serializer: Sprangular::PaymentSourceSerializer

    def completed_orders
      object.orders.complete
    end

    def payment_sources
      object.credit_cards
    end
  end
end