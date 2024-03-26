class SongTag < ApplicationRecord
  validates :song_id, :tag_id, presence: true
  belongs_to :song, optional: true
  belongs_to :tag, optional: true
end
