class Artist < ApplicationRecord
	has_many :artworks
	accepts_nested_attributes_for :artworks
end
