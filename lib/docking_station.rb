require_relative 'bike'

class DockingStation

  def release_bike
    if @bike == nil
      raise "No bikes available"
    else
    Bike.new
    end
  end

  def dock_bike(bike)
      @bike = bike
  end

attr_reader :bike

end
