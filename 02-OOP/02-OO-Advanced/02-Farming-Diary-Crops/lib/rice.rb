# TODO: code the Rice class
require_relative "crop"

class Rice < Crop
  def transplant!
    @grains += 10
  end

  def water!
    @grains += 5
  end
end
