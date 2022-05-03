require_relative 'recipe'
require 'csv'

class Cookbook
  attr_reader :recipes, :csv_file_path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []

    csv_load_file
  end

  def csv_load_file
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    file_raw_data = CSV.read(@csv_file_path, csv_options)
    @recipes = file_raw_data.map do |array|
      array['rating'] = array['rating'].to_f
      array['was_done'] = array['was_done'] == "true"
      Recipe.new(array['name'], array['description'], array['rating'], array['was_done'])
    end
  end

  def csv_save
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << Recipe.headers
      @recipes.each do |recipe|
        recipe.was_done = (recipe.was_done ? "true" : "false")
        csv << [recipe.name, recipe.description, recipe.rating, recipe.was_done]
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

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done
    csv_save
  end
end
