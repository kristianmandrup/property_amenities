require 'spec_helper'

class ClazzContainer
  include Property::Amenities::Clazz
end  

describe Property::Amenities::Clazz do
  subject { container }

  def category_clazz name
    "Property::Amenities::#{name.to_s.camelize}".constantize
  end

  describe 'amenity category classes' do
    context 'have all been created' do
      let(:container)   { ClazzContainer.new }

      Property::Amenities.amenities.each do |amenity|
        it "#{amenity} is a subclass of Property::Amenities::Base" do
          expect(category_clazz(amenity).superclass).to eq Property::Amenities::Base
        end
      end
    end
  end
end