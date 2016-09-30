require_relative 'bike'

class DockingStation

  attr_accessor :capacity, :working_bikes, :broken_bikes
    DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @working_bikes = []
      @broken_bikes = []
  end

  def release_bike

    raise "No bikes available" if empty?
    @working_bikes.pop

  end

  def dock_bike(bike)
    raise "Bike station full" if full?
  if bike.broken? == true
    @broken_bikes << bike
  else
      @working_bikes << bike
  end
  end

  private

  def full?
    (@working_bikes.count)+(@broken_bikes.count) >= @capacity
  end

  def empty?
    @working_bikes.empty?
  end
end
