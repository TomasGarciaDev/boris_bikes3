require "van"

describe Van do
    it "should be able to create an instance of van" do
        expect(Van).to respond_to(:new)
    end

    it "should be able to pick up bikes" do
        expect(subject).to respond_to(:pickup)
    end

    it "should be able to drop off bikes" do
        expect(subject).to respond_to(:dropoff)
    end

    it "should be able to pick up one bike" do
      station = DockingStation.new
      bike = Bike.new(true)
      station.dock(bike)
      expect(subject.pickup(station)).to match_array(Array.new << bike)
    end

    it "should only pick up broken bikes" do
      station = DockingStation.new
      bike = Bike.new
      bike_broken = Bike.new
      bike_broken.report_broken
      station.dock(bike)
      station.dock(bike_broken)
      expect(subject.pickup(station)).to match_array(Array.new << bike_broken)
    end

    it "broken bikes are removed from station after pickup" do
      station = DockingStation.new
      bike_broken = Bike.new(true)
      station.dock(bike_broken)
      before = station.bikes.length
      subject.pickup(station)
      after = station.bikes.length
      expect(before).not_to eq(after)
      #pick up broken
      #we expect the "length" to be different nowbi
    end
end