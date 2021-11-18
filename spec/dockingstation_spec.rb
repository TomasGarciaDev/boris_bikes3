require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to :release_bike } 
  
  it 'relseases working bike' do
    subject.dock(Bike.new)
    # bike = subject.release_bike
    expect(subject.release_bike.broken?).to be_falsey
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
    DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error("Station full")
  end

  it "Should raise an error when there are more than one arguments for initialize" do
    expect {subject(1,2)}.to raise_error(ArgumentError)
  end

  it { expect(DockingStation).to respond_to(:new).with(1).argument }

  it "should have a default capacity of 20 when no armgument is given" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # it "should issue a report when broken bike docked" do
  #   bike = Bike.new(false)
  #   expect(subject.dock(bike)).to eq "Broken bike docked. Reported issues."
  # end

  it "shouldn't release a bike if broken" do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error "Can not release broken bike"
  end
end