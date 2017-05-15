require 'docking_station'

describe DockingStation do

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end


  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'can dock a bike' do
    bike=Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns a docked bike' do
    bike=Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end

  it 'removes the most recently docked bike' do
    bike1=Bike.new
    bike2=Bike.new
    subject.dock(bike1)
    subject.dock(bike2)
    expect( subject.release_bike ).to eq bike2 
  end

  it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when carrying capacity is reached' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error 'Docking Station is Full'
  end

  it 'has a default capacity' do
    expect( subject.capacity ).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'allows the user to set their own capacity' do
    station = DockingStation.new(50)
    50.times { station.dock(Bike.new) }
    expect{ station.dock(Bike.new) }.to raise_error 'Docking Station is Full'
  end

  it 'Must display the number of bikes stored in a docking station' do
    station = DockingStation.new(28)
    25.times { station.dock(Bike.new) }
    expect( station.dock_size ).to eq(25)
  end

  it 'must not release a broken bike' do
    bike=Bike.new
    bike.report_broken
    subject.dock(bike)
    expect(subject.release_bike).to raise_error 'Bike is Broken'
  end

end
