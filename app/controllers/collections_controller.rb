class CollectionsController < ApplicationController

	def new 
		@collection = Collection.new
		@museum_select = current_user.museums
	end

	def create
		museum = Museum.find_by(id: params[:collection][:museum_id])
		collection = Collection.create(collection_params)
		museum.collections << collection
		redirect_to museum_path(museum)
	end 

	def show		
		raise_params
		@collection = Collection.find_by(id:params[:id])
	end 

	def edit 
		@collection = Collection.find_by(id:params[:id])
	end 

	def update
		collection = Collection.find_by(id:params[:id])
		artwork = Artwork.find_by(id: params[:artwork])
		if collection.artworks.any? {|a| a == artwork }
			collection.artworks.delete(artwork)
		else
			collection.artworks << artwork
		end
		collection.save
		redirect_to artwork_path
	end 

	private 

		def collection_params 
		params.require(:collection).permit(
			:name, 
			:description,
			:start_date,
			:end_date
			)
		end

end
