class ArtworksController < ApplicationController

	def index
		@artworks = Artwork.all
	end

	def new
		
		# @artwork = Artwork.new
		# current_user.artworks.build
		
		redirect_to new_artist_url
	end 

	def create
		@artwork = Artwork.create(artwork_params)
		current_user.artworks << @artwork
		@artwork.save
		redirect_to user_path(current_user)
	end 

	def show
		@artwork = Artwork.find_by(id:params[:id])
		@collections = Collection.all.select{|c| current_user.can_manage?(c)}
	end 

	def edit
		@artwork = Artwork.find_by(id:params[:id])
	end

 private 

	def artwork_params 
		params.require(:artwork).permit(
			:artist_id,
			:title,
			:price,
			:technic,
			:user_id
			)
	end

end
