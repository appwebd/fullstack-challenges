class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def self.headers
    %w[id name address]
  end

  def build_row
    [@id, @name, @address]
  end

  def prepare_array(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
