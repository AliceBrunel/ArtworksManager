class ArtistsController < ApplicationController

	def index
		@artists = Artist.all
	end

	def new 
		@artist = Artist.new
		@artist.artworks.build
	end 

	def create
		artist = Artist.create(artist_params)
		artwork = artist.artworks.last
		artwork.user = current_user
		artist.save
		redirect_to artist_path(artist)
	end 

	def show 
		@artist = Artist.find_by(id:params[:id])
	end 

	def edit
		@artist = Artist.find_by(id:params[:id])
	end 


 private 

	def artist_params 
		params.require(:artist).permit(
			:full_name,
			:biography,
			:birth_date,
			:death_date,
			:style,
			artworks_attributes: [
				:user_id,
				:title,
				:price,
				:technic
				]
		)
	end

end
