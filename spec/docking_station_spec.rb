require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq [bike]
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'doesn\'t release a bike when there are none' do
    docking_station = DockingStation.new
    if docking_station.bikes == nil
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end

  it "doesn't accept more than capacity" do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(bike)}
    if subject.bikes.count >= DockingStation::DEFAULT_CAPACITY
      expect {subject.dock_bike(bike)}.to raise_error("Bike station full")
    end
  end

end
