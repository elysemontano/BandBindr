class Member < ApplicationRecord
  validates :organization_id, :user_id, presence: true
  belongs_to :user
  belongs_to :organization
end
