class Property
  module HasAmenities
    extend ActiveSupport::Concern

    included do
      embeds_one :amenities, class_name: 'Property::Amenities', inverse_of: :property

      delegate *Property::Amenities.amenities, to: :amenities

      after_initialize do
        self.amenities = Property::Amenities.create property: self unless self.amenities
      end      
    end
  end
end