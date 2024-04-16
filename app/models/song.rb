class Song < ApplicationRecord
  validates :organization_id, :song_name, presence: true
  belongs_to :organization
  has_many :people, through: :keys
  has_many :keys
  has_many :tags, through: :song_tags
  has_many :song_tags

  def self.ransackable_attributes(auth_object = nil)
    %w[song_name] # Add other searchable attributes here if needed
  end
end
