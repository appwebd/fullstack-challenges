class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # destroy the current instance from the database
  def destroy
    query = "DELETE FROM posts WHERE id = ?"
    DB.execute(query, @id)
  end
end
