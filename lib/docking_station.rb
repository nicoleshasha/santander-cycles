require_relative 'bike'

class DockingStation

  attr_accessor :capacity, :bikes #, :working_bikes, :broken_bikes
    DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
  end

  def release_bike
    broken_bikes = []
    raise "No bikes available" if empty?

    raise "No bikes available" if @bikes.select{|bike| bike.broken? == true}.count == @bikes.count

    @bikes.pop if @bikes.select{|bike| bike.broken? == true}.empty?

    broken_bikes = @bikes.select{|bike| bike.broken? == true}
    @bikes.select! {|bike| bike.broken? == nil}
    bike_to_return = @bikes.pop
    @bikes.concat broken_bikes
    return bike_to_return
  end

  def dock_bike(bike)
    raise "Bike station full" if full?
    #if bike.condition == "broken"
    #  broken_bikes << bike
    #end
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
