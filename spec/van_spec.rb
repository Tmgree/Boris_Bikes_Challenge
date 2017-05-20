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

end
