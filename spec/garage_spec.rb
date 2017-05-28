require 'garage'

describe Garage do

  describe '#take_bikes_from_van' do

    it 'should fail if the van does not have any broken bikes' do
      van=double(:van, broken_bikes_van: [])
      expect{subject.take_bikes_from_van(van)}.to raise_error 'No broken Bikes'
    end

    it 'should take all bikes from the van' do
      van=double(:van, broken_bikes_van: [1,2], reset_broken_bikes_van: [])
      expect(subject.take_bikes_from_van(van)).to eq [1,2]
    end

  end

  describe '#take_bike' do

    it 'should take a broken bike into the garage' do
      bike=double(:bike, broken: true)
      expect(subject.take_bike(bike)).to eq [bike]
    end
  end

  describe '#fix_bikes' do

    it 'should fix all bikes in the garage' do
      bike=double(:bike, broken: true, fix: false)
      subject.take_bike(bike)
      expect(subject.fix_bikes).to eq [bike]
    end

  end

end
