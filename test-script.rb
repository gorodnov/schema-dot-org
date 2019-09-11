# frozen_string_literal: true

require 'date'

require 'schema_dot_org/person'
require 'schema_dot_org/place'
require 'schema_dot_org/organization'
require 'schema_dot_org/web_site'
require 'schema_dot_org/offer'
require 'schema_dot_org/offer'
require 'schema_dot_org/product'
require 'schema_dot_org/list_item'
require 'schema_dot_org/item_list'
include SchemaDotOrg


public_law = Organization.new(
  name:             'Public.Law',
  founder:           Person.new(name: 'Robb Shecter'),
  founding_date:     Date.new(2009, 3, 6),
  founding_location: Place.new(address: 'Portland, OR'),
  email:            'say_hi@public.law',
  url:              'https://www.public.law',
  logo:             'https://www.public.law/favicon-196x196.png',
  same_as: [
    'https://twitter.com/law_is_code',
    'https://www.facebook.com/PublicDotLaw'
    ]
)

puts public_law


site_info = WebSite.new(
  name: 'Texas Public Law',
  url:  'https://texas.public.law',
  potential_action: SearchAction.new(
    target: 'https://texas.public.law/?search={search_term_string}',
    query_input: 'required name=search_term_string'
  )
)


puts site_info

products_list = ItemList.new(
    url: 'https://www.public.law/list_items',
    item_list_element: [
        ListItem.new(
            position: 1,
            item: Product.new(
                name: 'Sample Product',
                sku: 'SAMPLE',
                url: 'https://www.public.law/sample_product',
                category: 'Samples category',
                image: 'https://www.public.law/images/img.png',
                weight: '2 LBS',
                description: 'Product description',
                offers: [
                    Offer.new(
                        price: 10.0,
                        price_currency: 'USD',
                        item_condition: 'http://schema.org/NewCondition'
                    )
                ]
            )
        )
    ]
)

puts products_list
