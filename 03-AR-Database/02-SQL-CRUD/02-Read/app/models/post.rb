# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id] || attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @url = attributes[:url] || attributes["url"]
    @votes = attributes[:votes] || attributes["votes"]
  end

  def self.find(id)
    DB.results_as_hash = true
    id = id.to_i
    rows = DB.execute("SELECT * FROM posts WHERE id = ? LIMIT 1;", id).first

    rows.nil? ? nil : Post.new(rows)
  end

  def self.all
    DB.results_as_hash = true
    rows = DB.execute('SELECT * FROM posts')
    rows.nil? ? [] : rows.map! { |post| Post.new(post) }
  end
end
