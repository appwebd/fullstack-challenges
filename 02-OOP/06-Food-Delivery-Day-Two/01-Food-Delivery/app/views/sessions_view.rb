require_relative 'base_view'

class SessionsView < BaseView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end

  def print_wrong_credentials
    puts 'The username or password is incorrect ... Try again'
  end
end
