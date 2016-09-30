require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity
    DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Bike station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
