require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end
  def release_bike
    raise "No bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Bike station full" if @bikes.count >= 20
    @bikes << bike
  end

  attr_reader :bikes

end
