class Property::Amenities
  class Base
    class << self    
      def amenity_name
        name.demodulize.underscore
      end

      def items        
        config_for(amenity_name).keys
      end        

      def inherit
        items.each do |item|
          field item, type: Boolean
        end
      rescue    
      end

      def inherited(base)
        base.class_eval do
          include Mongoid::Document
          # include BasicDocument

          embedded_in :amenities, class_name: 'Property::Amenities'

          inherit
        end
      end

      protected

      def config_for name
        raise "amenities configuration missing #{name} key - #{amenities_config.inspect}" unless has_config? name
        amenities_config.send(name)
      end

      def has_config? name
        amenities_config.respond_to?(name) && !amenities_config.send(name).blank?
      end

      def amenities_config
        MainApp.config.amenities
      end        
    end
  end
end