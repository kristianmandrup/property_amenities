class Property::Amenities
  module Categories
    extend ActiveSupport::Concern

    # See property/clazz.rb
    included do
      include_concern :clazz, from: 'Property::Amenities'

      Property::Amenities.amenities.each do |amenity|
        embeds_one amenity, class_name: Property::Amenities.amenity_class_name(amenity)
        delegate *Property::Amenities.amenity_class(amenity).items, to: amenity
      end

      after_initialize do
        configure_amenities
      end
    end      

    protected

    def configure_amenities
      Property::Amenities.amenities.each do |amenity|
        self.send "#{amenity}=", Property::Amenities.amenity_class(amenity).new
      end
    end
  end
end