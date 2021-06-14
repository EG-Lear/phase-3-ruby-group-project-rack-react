class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  has_and_belongs_to_many :playlists
end