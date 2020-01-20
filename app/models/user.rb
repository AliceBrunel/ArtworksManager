class User < ApplicationRecord
	has_many :teams
	has_many :museums, through :teams
	has_one :job
	has_many :artworks
end
