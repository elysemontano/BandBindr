class Key < ApplicationRecord
  validates :person_id, :song_id, :song_key, presence: true
  belongs_to :person, optional: true
  belongs_to :song, optional: true
end
