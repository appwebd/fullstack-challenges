require_relative '../lib/queries'
require 'sqlite3'

# @return count of artist
def artist_count(db)
  query = <<-SQL
    SELECT count(*) FROM artists
  SQL
  result = db.execute(query)
  result[0].join(' ').to_s.to_i
end

# @return count number of rows in table table_name
def number_of_rows(db, table_name)
  query = <<-SQL
    SELECT COUNT(*)
    FROM  #{table_name}
  SQL
  result = 0
  result = db.execute(query) if table_name.length.positive?
  result[0].join(' ').to_s.to_i
end

# @return array of artists' names sorted alphabetically
def sorted_artists(db)
  query = <<-SQL
    SELECT name
    FROM  artists
    ORDER BY name
  SQL
  result = db.execute(query)
  result.map { |item| item.join(',') }
end

# @return array of love songs' names
def love_tracks(db)
  query = <<-SQL
    SELECT name
    FROM  tracks
    WHERE name like "%love%"
  SQL
  result = db.execute(query)
  result.map { |item| item.join(' ') }
end

# @return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
def long_tracks(db, min_length)
  query = <<-SQL
    SELECT distinct name
    FROM  tracks
    WHERE milliseconds / 60000 >= #{min_length}
    ORDER BY milliseconds  asc
  SQL
  tracks = db.execute(query)
  tracks.map { |item| item.join(',') }
end
