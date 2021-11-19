require_relative 'dockingstation'

class Van

    def pickup(station)
      @van = station.bikes.select {|bike| bike.broken == true}
    #   station.bikes.each do |bike| 
    #     if bike.broken?
    #       @van.push(bike.broken?)
    #     end
    #   end  
    @van                  
    end

    def dropoff
    end

end

van = Van.new
station = DockingStation.new
bike = Bike.new
bike_broken = Bike.new(true)
station.dock(bike)
station.dock(bike_broken)
puts van.pickup(station)

#What do we want van to do
#Two things
#  - Pick up broken bike from docking station
#  - Drop broken bike at garage

# the van goes to the docking st and if there are broken bikes, takes them
# pickup -> if there are broken, takes them
# Need to have pickup method on van class
# van.pickup(station)
# van.dropoff(garage)