class Property::Amenities
  module Clazz
    extend ActiveSupport::Concern

    included do
      # create special classes
      amenities.each do |amenity|
        Property::Amenities::ClassFactory.create amenity
      end
    end

    module ClassMethods
      def amenities
        [:climatization, :whiteware, :exterior, :interior, :media, :rules]
      end

      def amenity_class name
        amenity_class_name(name).constantize
      end      

      def amenity_class_name name
        "Property::Amenities::#{name.to_s.camelize}"
      end
    end
  end
end