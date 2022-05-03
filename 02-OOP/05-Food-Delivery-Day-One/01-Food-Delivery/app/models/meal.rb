class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.headers
    %w[id name price]
  end

  def build_row
    [@id, @name, @price]
  end

  def prepare_array(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
