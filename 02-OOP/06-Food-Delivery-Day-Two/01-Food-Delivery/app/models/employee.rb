class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
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

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
