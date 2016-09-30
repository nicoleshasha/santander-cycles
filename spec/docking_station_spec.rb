require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument}


  it 'releases working bikes' do
    bike = double(:bike, broken?: false)
    docking_station = DockingStation.new
    docking_station.dock_bike(bike)
    expect(docking_station.release_bike).to be bike
  end

  it 'docks a bike' do
    bike = double(:bike, broken?: true)
    expect(subject.dock_bike(bike)).to eq [bike]
  end

  it 'returns docked bike' do
    bike = double(:bike, broken?: false)
    subject.dock_bike(bike)
    expect(subject.working_bikes).to eq [bike]
  end

  it 'doesn\'t release a bike when there are none' do
    docking_station = DockingStation.new
      expect {docking_station.release_bike}.to raise_error("No bikes available")
  end

  it 'doesn\'t accept more than capacity' do
    bike = double(:bike, broken?: true)
    DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(bike)}
    expect {subject.dock_bike(bike)}.to raise_error("Bike station full")
  end

  it 'allows user to set capacity' do
    docking_station = DockingStation.new(25)
    expect(docking_station.capacity).to eq 25
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
