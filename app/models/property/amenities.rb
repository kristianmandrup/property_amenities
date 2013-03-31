class Property
  class Amenities
    include Mongoid::Document

    embedded_in :property, class_name: 'Property', inverse_of: :amenities

    include_concerns :categories
  end
end