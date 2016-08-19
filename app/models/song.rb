class Song < ActiveRecord::Base
	validates :artist, :title, presence: true
  validates :title, :artist, length: { in: 2..20 }, on: :create
	has_many :user_songs
	has_many :users, :through => :user_songs
end
