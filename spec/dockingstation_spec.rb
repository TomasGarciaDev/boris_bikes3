require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to :release_bike } 
  
  it 'relseases working bike' do
    subject.dock(Bike.new)
    # bike = subject.release_bike
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  

  it { is_expected.to respond_to(:bikes) }
  

  it 'docks something' do
    station = DockingStation.new
    first_state = station.bikes.length
    station.dock(Bike.new)
    expect(station.bikes.length).to eq first_state + 1
  end
 
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq Array.new.push(bike)
  end

  it "raise an error when there are no bikes" do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  # it "raise an error when docking a bit if there is already a bike" do
  #   subject.dock(Bike.new)
  #   expect {subject.dock(Bike.new)}.to raise_error("Station full")
  # end

  it "raised an error if there are over 20 bikes" do
    20.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error("Station full")
  end
end