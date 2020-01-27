class InventoriesController < ApplicationController

	def new
		@inventory = Inventory.new
		@collection = Collection.find_by(id: params[:collection_id])
	end

	def create
	end

	def show 
	end 

end