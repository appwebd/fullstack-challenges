require_relative '../repositories/employee_repository'

class EmployeesController
  def initialize(employee_repository)
    @employee_repository = employee_repository
  end
end
