require_relative '../views/customers_view'
require_relative '../repositories/customer_repository'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    name = @view.ask_for_string('Enter a name')
    address = @view.ask_for_string('Enter a address')

    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
    list
  end

  def list
    @view.display(@customer_repository.all)
  end
end
