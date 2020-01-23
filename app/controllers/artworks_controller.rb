class ArtworksController < ApplicationController
skip_before_action :verify_user_is_authenticated

  def index
   @artworks = Artwork.all
  end

  def new 
   @artwork = Artwork.new
  end 

  def create
   @user = User.find_by(id: session[:user_id])
   @artwork = @user.artworks.create(artwork_params)
   @artwork.save
   redirect_to artwork_path(artwork_url)
  end 

  def show 
   @artwork = Artwork.find_by(id:params[:id])
  end 

 private 

   def artwork_params 
     params.require(:artwork).permit(
	 :artist_id,
	  :title,
	  :price,
	  :technic
      )
   end

end
