class Collection < ApplicationRecord
	has_many :inventories
	has_many :artworks, through: :inventories
	belongs_to :museum 
end
