require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    csv_load_file if File.exist?(@csv_file_path)
  end

  def all_riders
    @elements.filter { |item| item.role == 'rider' }
  end

  def find(id)
    @elements.find { |item| item.id == id }
  end

  def find_by_username(username)
    @elements.find { |item| item.username == username }
  end

  def csv_load_file
    csv_options = { col_sep: ',',
                    headers: :first_row,
                    header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def csv_write_file
    csv_options = { col_sep: ',',
                    force_quotes: true,
                    headers: :first_row }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << Employee.headers
      @elements.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end
end
