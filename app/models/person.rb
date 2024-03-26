class Person < ApplicationRecord
  validates :organization_id, :first_name, :last_name, presence: true
  belongs_to :organization
  has_many :songs, through: :keys
  has_many :keys
end
