class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, uniqueness: true
	
	has_many :teams
	has_many :museums, through: :teams
	has_many :artworks

	
	
	def can_manage_collections?
		user_museums = self.museums
		museum.teams.where("user_id = ?", self.id) ? true : false
	end
end
