class User < ActiveRecord::Base
validates :first_name, :last_name, presence: true
  validates :password, length: { in: 2..20 }, on: :create
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

	has_many :user_songs
	has_many :songs, :through => :user_songs

  has_secure_password
end
