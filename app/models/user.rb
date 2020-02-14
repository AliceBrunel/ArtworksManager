class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates :email, presence: true, uniqueness: true
	
	has_many :teams
	has_many :museums, through: :teams
	has_many :artworks

	
	
	def can_manage?(collection)
		museum = collection.museum
		museum.users.find_by(id: 1) ? true : false
	end

end
