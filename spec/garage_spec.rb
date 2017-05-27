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

end
