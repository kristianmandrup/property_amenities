class Property
  class Amenity
    class Category
      attr_accessor :title, :amenities

      def initialize title, *list
        @title = title
        list.flatten.compact.each do |label|
          amenities << create_amenity(label)
        end
      end

      def create_amenity label
        Property::Amenity.new(label)
      end

      def amenities
        @amenities ||= []
      end

      def each &block
        amenities.each{|a| yield a}
      end
    end
  end
end