class Post < ActiveRecord::Base
  belongs_to :user

  # Add some validation

  validates :title, :url, :user, presence: true
  validates :url, format: { with: /((http)|(HTTP)|(https)|(HTTPS)):\/\/.*/ }
  validates :title, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
end
