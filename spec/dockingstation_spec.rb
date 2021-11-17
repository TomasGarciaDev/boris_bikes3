require "dockingstation"

describe DockingStation do
  it "releases bike" do
    station = DockingStation.new
    expect(station).to respond_to(:release_bike)
  end

  it 'should create a new instance of bike' do
    expect(Bike.new).to be_an_instance_of(Bike)
  end 

  it 'Bike instance should respond to working?' do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end

  it "docks a bike" do
    station = DockingStation.new
    # bike = Bike.new
    expect(station).to respond_to(:dock).with(1).argument
  end 
end