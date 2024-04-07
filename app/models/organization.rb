class Organization < ApplicationRecord
    validates :name, presence: true
    has_many :members, dependent: :destroy
    has_many :users, through: :members
    has_many :people, dependent: :destroy
    has_many :songs, dependent: :destroy
    has_many :tags, dependent: :destroy
end
