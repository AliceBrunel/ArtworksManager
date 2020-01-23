class User < ApplicationRecord
	has_secure_password
	
	has_one :group
	has_many :teams
	has_many :museums, through: :teams
	has_many :artworks

	validates :email, presence: true, uniqueness: true
end
