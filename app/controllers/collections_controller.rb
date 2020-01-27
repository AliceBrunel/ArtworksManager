class CollectionsController < ApplicationController

	def new 
		@collection = Collection.new
		museum.collections.build

	end

	def create
		museum = Museum.find_by(params[:museum_id])
		collection = Collection.create(collection_params)		
		redirect_to museum_path(museum)
	end 

	def show		
		@collection = Collection.find_by(id:params[:id])
	end 

	def edit 
		@collection = Collection.find_by(id:params[:id])
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
