class Tag < ApplicationRecord
  belongs_to :organization
  has_many :songs, through: :song_tags
  has_many :song_tags
end
