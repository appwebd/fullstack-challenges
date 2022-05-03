class Recipe
  attr_reader :name, :description, :rating, :was_done

  def initialize(name, description, rating, was_done)
    @name = name
    @description = description
    @rating = rating
    @was_done = was_done || false
  end

  def headers
    %w[name description rating was_done]
  end

  def mark_as_done
    @was_done = true
  end
end
