module SchemaDotOrg
  class ListItem < SchemaType
    attr_accessor :position,
                  :item

    validates :position,  type: Integer
    validates :item,      type: SchemaDotOrg::SchemaType

    def _to_json_struct
      {
          'position' => position,
          'item' => item.to_json_struct
      }
    end
  end
end

