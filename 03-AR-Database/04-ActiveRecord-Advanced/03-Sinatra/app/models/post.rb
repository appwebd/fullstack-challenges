class Post < ActiveRecord::Base
  belongs_to :user

  # Add some validation

  validates :title, :url, presence: true
  validates :url, format: { with: /((http)|(https)|):\/\/.*/i }
  validates :title, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
  validates :user, presence: true

  scope :by_most_popular, -> { order(votes: :desc) }
end
