class Restaurant
  attr_accessor :average_rating, :city, :name

  def initialize(city, name)
    @city = city
    @name = name
    @count = 0
    @sum = 0
  end

  def rate(new_rate)
    @count += 1
    @sum = @sum + new_rate
    @average_rating = @sum / @count.to_f
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |element| element.city == city }
  end
end
