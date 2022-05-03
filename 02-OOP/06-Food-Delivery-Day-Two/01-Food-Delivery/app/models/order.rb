class Order
  attr_reader :delivered, :meal, :customer, :employee
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    %w[id delivered meal_id customer_id employee_id]
  end
end
