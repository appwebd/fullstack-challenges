class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def save
    title = @title || ''
    url = @url || ''
    if @id.nil?
      query = "INSERT INTO posts (title, url) VALUES ('#{title}', '#{url}')"
      DB.execute(query)
      @id = DB.last_insert_row_id
    else
      query = "UPDATE posts SET title = '#{title}', url = '#{url}' WHERE id = #{@id}"
      DB.execute(query)
    end
  end
end
