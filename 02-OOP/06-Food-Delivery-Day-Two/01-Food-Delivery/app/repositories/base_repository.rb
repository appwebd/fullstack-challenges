require 'csv'

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1

    csv_load_file if File.exist?(@csv_file_path)
  end

  def create(item)
    item.id = @next_id
    @next_id += 1
    @elements << item

    csv_write_file
  end

  def all
    @elements
  end

  def find
    @elements.find { |item| item.id == id.to_i }
  end

  private

  def csv_load_file
    csv_options = { col_sep: ',',
                    headers: :first_row,
                    header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @elements << prepare_array(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def csv_write_file
    CSV.open(@csv_file_path, "w") do |csv|
      csv << @elements.first.class.headers
      @elements.each do |item|
        csv << item.build_row
      end
    end
  end
end
