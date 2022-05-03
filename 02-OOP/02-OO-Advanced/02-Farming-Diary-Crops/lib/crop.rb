class Crop
  attr_reader :grains

  def initialize
    @grains = 0
  end

  def ripe?
    @grains >= 15
  end
end
