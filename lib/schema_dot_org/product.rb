require 'schema_dot_org'

module SchemaDotOrg
  class Product < SchemaType
    attr_accessor :name,
                  :url,
                  :sku,
                  :weight,
                  :image,
                  :category,
                  :description,
                  :offers

    validates :name,        type: String, presence: true
    validates :url,         type: String, presence: true
    validates :sku,         type: String, allow_nil: true
    validates :weight,      type: String, allow_nil: true
    validates :image,       type: String, allow_nil: true
    validates :category,    type: String, allow_nil: true
    validates :description, type: String, allow_nil: true
    validates :offers,      type: Array,  allow_nil: false

    def _to_json_struct
      {
          'name' => name,
          'url' => url,
          'sku' => sku,
          'weight' => weight,
          'image' => image,
          'category' => category,
          'description' => description,
          'offers' => offers.map(&:to_json_struct)
      }
    end
  end
end
