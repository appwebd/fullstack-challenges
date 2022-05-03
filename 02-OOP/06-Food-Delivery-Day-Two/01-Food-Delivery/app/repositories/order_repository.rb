require "csv"
require_relative "../models/order"

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    csv_load_file if File.exist?(@csv_file_path)
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1

    csv_write_file
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    csv_write_file
  end

  def my_undelivered_orders(employee)
    @orders.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def csv_load_file
    csv_options = { col_sep: ',', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def csv_write_file
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << Order.headers
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
