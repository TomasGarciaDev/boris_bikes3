require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new
    @docked_bike = []
  end

  def release_bike
    @bike
  end

  def dock(bike)
    @docked_bike << bike
  end

  def show_bike
    @docked_bike
  end
end