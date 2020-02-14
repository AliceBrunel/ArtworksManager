class ArtworksController < ApplicationController

	def index
		@artworks = Artwork.all
	end

	def new
		
		@artwork = Artwork.new
		@artist = Artist.new
		current_user.artworks.build		
	end 

	def create
		
		@artwork = Artwork.create(artwork_params)
		unless params[:artist.full_name].empty?
			current_user.artworks << @artwork
			@artwork.save
		end

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
			:title,
			:price,
			:technic,
			:user_id
			)
	end

end
