require "dockingstation"

describe DockingStation do
  it "releases bike" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'should create a new instance of bike' do
    expect(Bike.new).to be_an_instance_of(Bike)
  end 

  it 'Bike instance should respond to working?' do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end
end