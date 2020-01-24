class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, uniqueness: true
	
	has_many :teams
	has_many :museums, through: :teams
	has_many :artworks

end
