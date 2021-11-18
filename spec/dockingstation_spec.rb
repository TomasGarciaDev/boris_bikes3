require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to :release_bike } 
  
  it 'relseases working bike' do
    subject.dock(Bike.new)
    # bike = subject.release_bike
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  

  it { is_expected.to respond_to(:bike) }
  

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
 
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it "raise an error when there are no bikes" do
    expect {subject.release_bike}.to raise_error("No bikes available")
  end
end