require 'docking_station'

describe DockingStation do


  describe '#release_bike' do

    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'must release a bike' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'must not release a broken bike' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'can dock a bike' do
      bike=double(:bike, broken: false)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'allows the user to set their own capacity' do
      station = DockingStation.new(50)
      50.times { station.dock(bike=double(:bike, broken: false)) }
      expect{ station.dock(Bike.new) }.to raise_error 'Docking Station is Full'
    end

    it 'must accept a returning working bike' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.dock(bike)).to eq [bike]
    end

  end

  describe '#full?' do

    it 'should identify when the dock is full' do
      station=DockingStation.new(1)
      bike=double(:bike, broken: false)
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
      25.times { station.dock(bike=double(:bike, broken: false)) }
      expect( station.dock_size ).to eq(25)
    end

  end

  describe 'no_working_bikes?' do

    it 'must identify that there are no working bikes docked' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      expect(subject.no_working_bikes?).to eq(true)
    end

  end

  describe '#working_bikes' do

    it { is_expected.to respond_to(:working_bikes) }

    it 'must count number of working bikes stored in docking station' do
      18.times { subject.dock(bike=double(:bike, broken: false)) }
      expect(subject.working_bikes).to eq(18)
    end

    it 'must add 1 to working bikes if a working bike is docked' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.working_bikes).to eq(1)
    end

    it 'must remove 1 to working bikes if a working bike is removed' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.working_bikes).to eq(0)
    end

  end


  describe '#broken_bikes' do

    it { is_expected.to respond_to(:broken_bikes) }

    it 'must count number of broken bikes stored in docking station' do
      18.times { subject.dock(bike=double(:bike, broken: false)) }
      expect(subject.broken_bikes).to eq(0)
    end

    it 'must add 1 to broken bikes if a broken bike is docked' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      expect(subject.broken_bikes).to eq(1)
    end

  end


  describe '#bikes' do

    it { is_expected.to respond_to(:bikes) }

    it 'returns a docked bike' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

    it 'should take not list a removed bike' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes).not_to include bike
    end

  end

  describe '#capacity' do

    it { is_expected.to respond_to(:capacity) }

    it 'has a default capacity' do
      expect( subject.capacity ).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can change the default capacity' do
      station=DockingStation.new(5)
      expect(station.capacity).to eq(5)
    end

  end


  describe '#working_bikes_array' do

    it { is_expected.to respond_to(:working_bikes_array) }

    it 'must store all working bikes docked in the station as a sub arry' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.working_bikes_array).to include(bike)
    end

    it 'must remove a bike if the bike is released from the docking station' do
      bike=double(:bike, broken: false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.working_bikes_array).not_to include bike
    end

  end



  describe '#broken_bikes_array' do

    it { is_expected.to respond_to(:broken_bikes_array) }

    it 'must store all working bikes docked in the station as a sub arry' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      expect(subject.broken_bikes_array).to include(bike)
    end

  end

  describe '#total' do

    it { is_expected.to respond_to(:total) }

    it 'must count total number of bikes stored in docking station' do
      bike1=double(:bike, broken: false)
      bike2 = double(:bike, broken: true)
      subject.dock(bike1)
      subject.dock(bike2)
      expect(subject.total).to eq(2)
    end

    it 'must subtract a bike if a bike is released from the station'do
    bike=double(:bike, broken: false)
    subject.dock(bike)
    subject.release_bike
    expect(subject.total).to eq(0)
    end
  end

  describe '#add_to_array' do

    it { is_expected.to respond_to(:add_to_array) }

    it 'should store a working docked bike in the working_bikes_array' do
      bike=double(:bike, broken: false)
      expect(subject.add_to_array(bike)).to eq [bike]
    end

    it 'should store a broken docked bike in the broken_bikes_array' do
      bike=double(:bike, broken: true)
      expect(subject.add_to_array(bike)).to eq [bike]
    end

  end

  describe '#reset_bikes' do

    it 'must reset the bikes array' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      bike1=double(:bike, broken: false)
      subject.dock(bike1)
      expect(subject.reset_bikes).to eq [bike1]
    end

  end

  describe '#reset_broken_bikes' do

    it 'must reset the broken bikes array' do
      bike=double(:bike, broken: true)
      subject.dock(bike)
      expect(subject.reset_broken_bikes).to eq []
    end

  end

  describe '#take_bikes_from_van' do

    it 'must take the bikes from the van' do
      van=double(:van, bikes_van: [1], reset_broken_bikes_van: [])
      expect(subject.take_bikes_from_van(van)).to eq [1]
    end

  end

end
