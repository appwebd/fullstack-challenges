require 'open-uri'
require 'nokogiri'

require_relative 'view'

class Controller
  URL_BASE = 'https://dev.to/'.freeze

  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    posts = @repository.all
    @view.display(posts)
  end

  def index
    list
  end

  def save_post_for_later
    path = @view.ask_user_for(:path)
    file = URI.open("#{URL_BASE}#{path}").read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".crayons-article__subheader a").text.strip
    post = Post.new(path: path, title: title, content: content, author: author)
    @repository.add(post)
    list
  end

  def read_post
    list
    index = @view.ask_user_for_index
    post = @repository.find(index)
    @view.display_content(post)
  end

  def mark_post_as_read
    list
    index = @view.ask_user_for_index
    @repository.mark_as_read(index)
    list
  end
end
