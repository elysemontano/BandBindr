class Tag < ApplicationRecord
  validates :organization_id, :tag_word, presence: true
  belongs_to :organization
  has_many :songs, through: :song_tags
  has_many :song_tags
end
