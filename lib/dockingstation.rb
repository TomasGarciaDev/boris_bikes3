require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new
  end

  def release_bike
    @bike
  end

  def dock(bike)


    # bike.class != Nil
    # docked_bike += 1

  end
end