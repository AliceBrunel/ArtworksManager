class CollectionsController < ApplicationController

	def new 
		@collection = Collection.new
	end

	def create 
		collection = Collection.create(collection_params)
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
