require 'csv'

# Return the `number` of most successful movies before `max_year`
def most_successful(number, max_year, file_path)

  result = load_data(file_path, max_year)
  result.sort_by! { |movie| movie[:earnings] }
  result.reverse.take(number)
end

def load_data(file_path, max_year)
  harsh_result = []
  CSV.foreach(file_path) do |row|
    next if row[1].to_i >= max_year

    harsh_result << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end
  harsh_result
end
