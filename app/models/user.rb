class User < ApplicationRecord
	has_many :teams
	has_many :museums, through: :teams
	has_many :artworks

end
