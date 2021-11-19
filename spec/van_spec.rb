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
end