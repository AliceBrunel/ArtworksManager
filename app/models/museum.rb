class Museum < ApplicationRecord
has_many :teams
has_many :users, through: :teams
has_many :collections
end
