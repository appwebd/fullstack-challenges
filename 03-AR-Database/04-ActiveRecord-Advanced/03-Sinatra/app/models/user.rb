class User < ActiveRecord::Base
  has_many :posts

  # Add some validation
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\..*\z/ }

  # Add some callbacks
  before_validation :strip_leading_trailing_spaces
  before_validation :ensure_username_has_a_value
  after_commit :do_send_a_welcome_email, on: :create

  private

  def ensure_username_has_a_value
    self.username = email if username.nil? && !username.blank? && !email.blank?
  end

  def do_send_a_welcome_email
    FakeMailer.instance.mail(email, "Welcome #{username}!")
  end

  def strip_leading_trailing_spaces
    self.email = email.strip if !email.nil? && !email.blank?
  end
end
