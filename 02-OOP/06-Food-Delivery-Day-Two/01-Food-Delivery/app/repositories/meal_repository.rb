require_relative '../models/meal'
require_relative 'base_repository'
require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1

    csv_load_file if File.exist?(@csv_file_path)
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal

    csv_write_file
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |item| item.id == id.to_i }
  end

  def csv_load_file
    csv_options = { col_sep: ',',
                    headers: :first_row,
                    header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def csv_write_file
    csv_options = { col_sep: ',', force_quotes: true }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << Meal.headers
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end

# repo = MealRepository.new('./data/meals.csv')
# p repo
