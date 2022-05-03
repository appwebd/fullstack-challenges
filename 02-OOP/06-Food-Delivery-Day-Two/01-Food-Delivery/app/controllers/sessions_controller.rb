require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    username = @sessions_view.ask_for_string('Username?')
    password = @sessions_view.ask_for_string('Password')
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password

    @sessions_view.print_wrong_credentials
  end
end
