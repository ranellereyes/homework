class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    hashed_pass = BCrypt::Password.create(password)
    user.password_digest == hashed_pass ? user : nil
  end

  def self.generate_random_token
    session_token = SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_random_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_random_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
