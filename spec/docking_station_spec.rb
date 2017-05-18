require 'docking_station'

describe DockingStation do


  describe '#release_bike' do

    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'must not release a broken bike' do
      bike=Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'can dock a bike' do
      bike=Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'allows the user to set their own capacity' do
      station = DockingStation.new(50)
      50.times { station.dock(Bike.new) }
      expect{ station.dock(Bike.new) }.to raise_error 'Docking Station is Full'
    end

  end

  describe '#full?' do

    it 'should identify when the dock is full' do
      station=DockingStation.new(1)
      bike=Bike.new
      station.dock(bike)
      expect(station.full?).to eq(true)
    end

  end

  describe '#empty?' do

    it 'should identify when the dock is empty' do
      station=DockingStation.new
      expect(station.empty?).to eq(true)
    end

  end

  describe '#dock_size' do

    it 'Must display the number of bikes stored in a docking station' do
      station = DockingStation.new(28)
      25.times { station.dock(Bike.new) }
      expect( station.dock_size ).to eq(25)
    end

  end

  describe 'no_working_bikes?' do

    it 'must identify that there are no working bikes docked' do
      bike=Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.no_working_bikes?).to eq(true)
    end

  end

  describe '#add_to_counter' do

    it 'must add 1 to working bikes if a working bike is docked' do
      bike=Bike.new
      expect(subject.add_to_counter(bike)).to eq(1)
    end

    it 'must add 1 to broken bikes if a broken bike is docked' do
      bike=Bike.new
      bike.report_broken
      expect(subject.add_to_counter(bike)).to eq(1)
    end

  end

  describe '#bikes' do

    it { is_expected.to respond_to(:bikes) }

    it 'returns a docked bike' do
      bike=Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

  end

  describe '#capacity' do

    it { is_expected.to respond_to(:capacity) }

    it 'has a default capacity' do
      expect( subject.capacity ).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

  describe '#working_bikes' do

    it { is_expected.to respond_to(:working_bikes) }

    it 'must count number of working bikes stored in docking station' do
      18.times { subject.dock(Bike.new) }
      expect(subject.working_bikes).to eq(18)
    end

  end

  describe '#broken_bikes' do

    it { is_expected.to respond_to(:broken_bikes) }

    it 'must count number of broken bikes stored in docking station' do
      18.times { subject.dock(Bike.new) }
      expect(subject.broken_bikes).to eq(0)
    end

  end

end
