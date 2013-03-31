require 'spec_helper'

describe Property::Amenities do
  subject { amenities }

  let(:property)  { create :property }
  let(:amenities) { property.amenities }

  it 'should not be nil' do
    expect(subject).to_not be_nil
  end

  it 'should be a Property::Amenities' do
    expect(subject).to be_a Property::Amenities
  end

  def category_clazz name
    "Property::Amenities::#{name.to_s.camelize}".constantize
  end

  describe 'amenity categories' do
    Property::Amenities.amenities.each do |amenity|
      describe amenity.to_s do
        subject { category }

        let(:category) { amenities.send amenity }

        describe "Amenity: #{amenity}" do
          it 'should have a category' do
            expect(subject).to_not be_nil
          end

          it 'should be a base category' do
            expect(subject).to be_a Property::Amenities::Base
          end

          it 'should be a category' do
            expect(subject).to be_a category_clazz(amenity)
          end

          describe 'all items are false' do
            Property::Amenities.amenity_class(amenity).items.each do |item|
              subject { category.send(item) }

              it "should have false #{item}" do
                expect(subject).to be_false
              end
            end
          end
        end
      end
    end
  end
end