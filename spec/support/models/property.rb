class Property
  include Mongoid::Document

  include_concerns :has_amenities
end