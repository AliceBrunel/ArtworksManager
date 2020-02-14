class MuseumsController < ApplicationController
	def index 
		@museums = Museum.all
	end

	def new 
		@museum = Museum.new
	end 

	def create 
		museum = Museum.create(museum_params)
		museum.users << current_user
		redirect_to museum_path(museum)
	end

	def show 
		@museum = Museum.find_by(id:params[:id])
	end

	def edit 
		@museum = Museum.find_by(id:params[:id])
	end
	
	private 

		def museum_params 
			params.require(:museum).permit(
				:name, 
				:location,
				:specialty
			)
		end
end
