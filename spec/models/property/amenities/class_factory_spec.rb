require 'spec_helper'

describe Property::Amenities::ClassFactory do
  subject { factory }

  let(:factory)   { Property::Amenities::ClassFactory }
  let(:name)      { :blip }

  def category_clazz name
    "Property::Amenities::#{name.to_s.camelize}".constantize
  end

  describe 'create(name)' do
    it 'should create Amenity category class' do
      expect(subject.create name).to be_a category_clazz(name)
    end
  end
end