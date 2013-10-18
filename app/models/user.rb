class User < ActiveRecord::Base
  require 'bcrypt'

  attr_accessible :username, :password, :email
  attr_reader :password

  validates :username, :session_token, :email, presence: true
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, :allow_nil => true }

  before_validation :ensure_session_token

  has_many(
    :subs,
    :primary_key => :id,
    :foreign_key => :moderator_id,
    :class_name => 'Sub'
  )

  has_many :links

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
