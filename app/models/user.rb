class User < ActiveRecord::Base
  attr_accessor :not_validate_password

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 6 }, unless: :not_validate_password
  has_secure_password

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
