require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes, :csv_file_path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []

    csv_load_file
  end

  def csv_load_file
    file_raw_data = CSV.read(@csv_file_path)
    @recipes = file_raw_data.map { |array| Recipe.new(array[0], array[1]) }
  end

  def csv_save
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    csv_save
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    csv_save
  end
end
