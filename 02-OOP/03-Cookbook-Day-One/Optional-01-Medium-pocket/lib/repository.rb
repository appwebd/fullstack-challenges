require_relative 'post'
require 'csv'

class Repository
  def initialize(csv_file_path)
    @posts = []
    @csv_file = csv_file_path
    csv_load
  end

  def all
    @posts
  end

  def add(post)
    @posts << post
    csv_save
  end

  def find(index)
    @posts[index]
  end

  def mark_as_read(index)
    @posts[index].mark_as_read!
    csv_save
  end

  private

  def csv_load
    CSV.foreach(@csv_file) do |row|
      @posts << Post.new(
        path: row[0],
        title: row[1],
        content: row[2],
        author: row[3],
        read: row[4]
      )
    end
  end

  def csv_save
    CSV.open(@csv_file, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.title, post.content, post.author, post.read?]
      end
    end
  end
end
