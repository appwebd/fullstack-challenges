require_relative '../models/customer'
require_relative 'base_repository'
require 'csv'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1

    csv_load_file if File.exist?(@csv_file_path)
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    csv_write_file
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |item| item.id == id.to_i }
  end

  def csv_load_file
    csv_options = { col_sep: ',',
                    headers: :first_row,
                    header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def csv_write_file
    csv_options = { col_sep: ',',
                    force_quotes: true,
                    headers: :first_row }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << Customer.headers
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

# repo = MealRepository.new('./data/meals.csv')
# p repo
