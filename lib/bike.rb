class Bike

  attr_reader :broken

  def initialize(broken = false)
    @broken = broken
  end  


  # def working?
  #   @working
  # end

  def report_broken
    @broken = true
  end

  # def broken?
  #   @broken
  # end
end