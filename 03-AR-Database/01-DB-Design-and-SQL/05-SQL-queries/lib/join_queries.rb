require 'sqlite3'

# @return the list of tracks with their album and artist.
def detailed_tracks(db)
  query = <<-SQL
    SELECT tracks.name, albums.title, artists.name
    FROM tracks
    INNER JOIN albums ON tracks.album_id = albums.id
    INNER JOIN artists ON albums.artist_id = artists.id
  SQL
  result = db.execute(query)
end

# @return For the given category of music, return the number of tracks and the average song length (as a stats hash)
def stats_on(db, genre_name)
  stat = db.execute(%(SELECT genres.name, COUNT(tracks.id), ROUND(AVG(milliseconds) / 60000, 2)
    FROM tracks
    INNER JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name = '#{genre_name}')).flatten

  {
    category: stat[0],
    number_of_songs: stat[1],
    avg_length: stat[2]
  }
end

# @return list of top 5 artists with the most songs for a given genre.
def top_five_artists(db, genre_name)
  db.execute(%(SELECT artists.id, artists.name, COUNT(tracks.id) AS track_count
    FROM tracks
    INNER JOIN albums ON tracks.album_id = albums.id
    INNER JOIN artists ON albums.artist_id = artists.id
    INNER JOIN genres ON tracks.genre_id = genres.id
    WHERE genres.name = '#{genre_name}'
    GROUP BY artists.id
    ORDER BY track_count DESC
    LIMIT 5))
end
