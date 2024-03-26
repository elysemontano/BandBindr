class Organization < ApplicationRecord
    validates :name, presence: true
    has_many :members 
    has_many :users, through: :members
    has_many :people
    has_many :songs
    has_many :tags
end
