require 'docking_station'

describe DockingStation do

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end


  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'can dock a bike' do
    bike=Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns a docked bike' do
    bike=Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when a second bike it docked' do
    bike1=Bike.new
    bike2=Bike.new
    subject.dock(bike1)
    expect { subject.dock(bike2) }.to raise_error 'Docking Station is Full'
  end



end
