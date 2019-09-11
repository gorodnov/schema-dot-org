require 'schema_dot_org'

module SchemaDotOrg
  class ItemList < SchemaType
    attr_accessor :url,
                  # :number_of_items,
                  # :item_list_order,
                  :item_list_element

    validates :url,                 type: String
    # validates :number_of_items,     type: Integer
    # validates :item_list_order,
    validates :item_list_element,   type: Array, allow_nil: false

    def _to_json_struct
      {
          'url' => url,
          # 'numberOfItems' => number_of_items,
          # 'itemListOrder' => item_list_order.to_json_struct,
          'itemListElement' => item_list_element.map(&method(:safe_to_json))
      }
    end
  end
end
