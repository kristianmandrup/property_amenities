class Property::Amenities
  class ClassFactory
    # http://johnragan.wordpress.com/2010/02/18/ruby-metaprogramming-dynamically-defining-classes-and-methods/
    def self.create name, parent_class = nil
      raise "Namespace error: Property::Amenities" unless defined?(Property::Amenities)
      parent_class ||= Property::Amenities::Base
              
      # puts "create special: #{name}"
      clazz = Property::Amenities.const_set class_name(name), Class.new(parent_class)
      clazz.inherit
      clazz
    end

    protected

    def self.class_name name
      name.to_s.camelize
    end
  end
end