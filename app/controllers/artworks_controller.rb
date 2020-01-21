class ArtworksController < ApplicationController
	
  def index
   @artworks = Artwork.all
  end

  def new 
   @artwork = Artwork.new
  end 

  def create
   artwork = Artwork.create artwork_params
   redirect_to artwork_path(artwork)
  end 

  def show 
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
