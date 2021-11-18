require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end

end