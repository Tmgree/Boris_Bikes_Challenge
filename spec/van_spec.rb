require 'van'

describe Van do

  describe '#collect_bikes' do

    it 'must collect broken bikes from a docking station' do

    end

    it 'must raise an error if the docking station has no broken bikes docked' do
      station=double(:DockingStation, broken_bikes_array: [])
      expect{subject.collect_bikes(station)}.to raise_error 'No broken Bikes'
    end

  end

  describe '#reset_docking_station' do

    it 'must reset the bikes array' do
      station=double(:DockingStation, bikes: [1], broken_bikes_array: [1])
      expect(subject.reset_docking_station(station)).to eq []
    end

  end

  describe '#reset_broken_bikes' do

    it 'must reset the broken bikes array' do
      station=double(:DockingStation, broken_bikes_array: [1])
      expect(subject.reset_broken_bikes(station)).to eq []
    end

  end

end
