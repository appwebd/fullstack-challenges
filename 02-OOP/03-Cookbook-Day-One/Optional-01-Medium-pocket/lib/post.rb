class Post
  attr_reader :title, :author, :path, :content

  def initialize(attributes = {})
    @path = attributes[:path]
    @title = attributes[:title]
    @content = attributes[:content]
    @author = attributes[:author]
    @read = attributes[:read] == 'true'
  end

  def read?
    @read
  end

  def to_s
    "#{title} (#{author})\n\n#{content}"
  end

  def mark_as_read!
    @read = true
  end
end
