require "dockingstation"

describe DockingStation do
  it "releases bike" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end
end