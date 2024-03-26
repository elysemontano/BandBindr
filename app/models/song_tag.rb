class SongTag < ApplicationRecord
  belongs_to :song, optional: true
  belongs_to :tag, optional: true
end
