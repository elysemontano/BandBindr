class Key < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :song, optional: true
end
