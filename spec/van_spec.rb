require 'van'

describe Van do

  describe '#collect_bikes' do

    it 'must collect broken bikes from a docking station' do
      station=double(:DockingStation, broken_bikes_array: [1,2],
      reset_broken_bikes: [], reset_bikes: [])
      expect(subject.collect_bikes(station)).to eq [1,2]
    end

    it 'must raise an error if the docking station has no broken bikes docked' do
      station=double(:DockingStation, broken_bikes_array: [])
      expect{subject.collect_bikes(station)}.to raise_error 'No broken Bikes'
    end

  end

  describe '#take_bikes' do

    it 'should fill the van with broken bikes' do
      station=double(:DockingStation, broken_bikes_array: [1,2])
      expect(subject.take_bikes(station)).to eq [1,2]
    end

  end

  describe 'bikes_van' do

    it 'should store the bikes' do
      bike=double(:Bike, broken: true)
      station=double(:DockingStation, bikes: [bike], broken_bikes_array: [bike],
      reset_broken_bikes: [], reset_bikes: [])
      subject.collect_bikes(station)
      expect(subject.bikes_van).to eq [bike]
    end

  end

  describe '#reset_broken_bikes_van' do

    it 'should reset the broken bikes stored in the van' do
      bike=double(:Bike, broken: true)
      station=double(:DockingStation, bikes: [bike], broken_bikes_array: [bike],
      reset_broken_bikes: [], reset_bikes: [])
      subject.collect_bikes(station)
      expect(subject.reset_broken_bikes_van).to eq []
    end

  end

  describe '#take_bike' do

    it 'should take a broken bike into the van' do
      bike=double(:bike, broken: true)
      expect(subject.take_bike(bike)).to eq [bike]
    end
  end

end
