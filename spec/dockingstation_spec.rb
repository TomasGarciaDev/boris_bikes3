require "dockingstation"

describe DockingStation do
  
  let(:bike) { double("bike", broken?: false) }  
  # bike = instance_double("bike", :broken? => false)

  it { is_expected.to respond_to :release_bike } 
  
  it 'relseases working bike' do
    # bike = double("bike")
    subject.dock(bike) #BIKE
    # allow(bike).to receive(:broken?) {false}
    expect(subject.release_bike.broken?).to be_falsey #BIKE
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  

  it { is_expected.to respond_to(:bikes) }
  

  it 'docks something' do

    station = DockingStation.new
    first_state = station.bikes.length
    station.dock(bike) #BIKE
    expect(station.bikes.length).to eq first_state + 1
  end
 
  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bikes).to eq Array.new.push(bike)
  end

  it "raise an error when there are no bikes" do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  it "raised an error if there are over 20 bikes" do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock bike } #BIKE
    expect { subject.dock bike }.to raise_error("Station full") #BIKE
  end

  it "Should raise an error when there are more than one arguments for initialize" do
    expect {subject(1,2)}.to raise_error(ArgumentError)
  end

  it { expect(DockingStation).to respond_to(:new).with(1).argument }

  it "should have a default capacity of 20 when no armgument is given" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "shouldn't release a bike if broken" do
    # allow(bike).to receive(:broken?) {true}
    bike2 = double(:bike, broken?: true)
    subject.dock(bike2)
    expect { subject.release_bike }.to raise_error "Can not release broken bike"
  end
end