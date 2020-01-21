class User < ApplicationRecord
	has_many :teams
	has_many :museums, through :teams
	has_many :artworks

	validates_presence_of :name, :surname, :email, :job
end
