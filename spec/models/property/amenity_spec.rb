require 'spec_helper'

describe Property::Amenity do
  subject { amenity }

  describe 'init' do
    context 'default value' do
      it 'should be created without errors' do
        expect { Property::Amenity.new :cooling }.to_not raise_error
      end

      it 'should be created with label: cooling' do
        expect(Property::Amenity.new(:cooling).label).to eq :cooling
      end

      it 'is a Property::Amenity' do
        expect(Property::Amenity.new :cooling).to be_a Property::Amenity
      end      
    end

    context 'value: true' do
      it 'should be created without errors' do
        expect { Property::Amenity.new :cooling, true }.to_not raise_error
      end

      it 'is a Property::Amenity' do
        expect(Property::Amenity.new :cooling, true).to be_a Property::Amenity
      end      
    end
  end

  context 'cooling amenity' do
    let(:amenity) { Property::Amenity.new :cooling }

    it 'is a Property::Amenity' do
      expect(subject).to be_a Property::Amenity
    end

    describe 'on?' do
      it "is not on" do
        expect(subject.on?).to be_false
      end
    end

    describe 'off?' do    
      it "is off" do
        expect(subject.off?).to be_true
      end
    end

    context 'set on' do
      before do
        subject.on!
      end

      describe 'on?' do
        it "is on" do
          expect(subject.on?).to be_true
        end
      end

      describe 'off?' do    
        it "is not off" do
          expect(subject.off?).to be_false
        end
      end
    end
  end

  context 'hot amenity (true)' do
    let(:amenity) { Property::Amenity.new :hot, true }

    it 'is a Property::Amenity' do
      expect(subject).to be_a Property::Amenity
    end

    describe 'on?' do
      it "is on" do
        expect(subject.on?).to be_true
      end
    end

    describe 'off?' do    
      it "is not off" do
        expect(subject.off?).to be_false
      end
    end
  end
end
