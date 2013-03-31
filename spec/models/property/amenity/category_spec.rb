require 'spec_helper'

describe Property::Amenity::Category do
  subject { category }

  let(:title)   { :whiteware }
  let(:labels)  { %w{fridge oven} }

  describe 'init' do
    let(:category) { Property::Amenity::Category.new title, *labels }

    it 'creates a Property::Amenity::Category' do
      expect(subject).to be_a Property::Amenity::Category
    end

    it "has the title set" do
      expect(subject.title).to eq title
    end    

    describe 'amenities' do
      subject { category.amenities }

      it 'should not be empty' do
        expect(subject).to_not be_empty
      end    
    end

    describe 'each' do
      it 'populatd with Property::Amenity' do
        subject.each do |amenity|
          expect(amenity).to be_a Property::Amenity
        end
      end    
    end
  end
end