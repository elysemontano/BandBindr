class Person < ApplicationRecord
  belongs_to :organization
  has_many :songs, through: :keys
  has_many :keys
end
