class Collection < ApplicationRecord
	has_many :inventories
	has_many :artworks, through: :inventories
end
