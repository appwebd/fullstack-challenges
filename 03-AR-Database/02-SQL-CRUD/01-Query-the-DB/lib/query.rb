require 'sqlite3'

# @purpose use `db` to execute an SQL query against the database to
# @return retrieve all columns from all records from the `artists` table.
def all_artists(db)
  query = <<-SQL
    SELECT *
    FROM artists
  SQL
  rows = db.execute(query)
end
