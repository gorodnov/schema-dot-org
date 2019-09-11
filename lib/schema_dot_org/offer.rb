require 'schema_dot_org'

module SchemaDotOrg
  class Offer < SchemaType
    attr_accessor :price,
                  :price_currency,
                  :item_condition

    validates :price,           type: Numeric,  presence: true
    validates :price_currency,  type: String,   presence: true
    validates :item_condition,  type: String

    def _to_json_struct
      {
          'price' => price.to_s,
          'priceCurrency' => price_currency,
          'itemCondition' => item_condition
      }
    end
  end
end
