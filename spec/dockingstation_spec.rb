require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to :release_bike } 
  
  it 'relseases working bike' do
    # bike = double("bike")
    # allow(bike).to receive(:broken?) {false}
    subject.dock(double :bike) #BIKE
    expect(subject.release_bike.broken?).to be_falsey #BIKE
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  

  it { is_expected.to respond_to(:bikes) }
  

  it 'docks something' do
    # bike = double("bike")
    station = DockingStation.new
    first_state = station.bikes.length
    station.dock(double :bike) #BIKE
    expect(station.bikes.length).to eq first_state + 1
  end
 
  it 'returns docked bikes' do
    bike = double :bike
    # bike = Bike.new #BIKE
    subject.dock(bike)
    expect(subject.bikes).to eq Array.new.push(bike)
  end

  it "raise an error when there are no bikes" do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it "raised an error if there are over 20 bikes" do
    # bike = double("bike")
    DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike } #BIKE
    expect { subject.dock :bike }.to raise_error("Station full") #BIKE
  end

  it "Should raise an error when there are more than one arguments for initialize" do
    expect {subject(1,2)}.to raise_error(ArgumentError)
  end

  it { expect(DockingStation).to respond_to(:new).with(1).argument }

  it "should have a default capacity of 20 when no armgument is given" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "shouldn't release a bike if broken" do
    # bike = double("bike")
    # bike = Bike.new #BIKE
    bike.report_broken
    subject.dock(double :bike)
    expect { subject.release_bike }.to raise_error "Can not release broken bike"
  end
end