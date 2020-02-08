module DeviseWhitelist
# If something is rails specific, it is a class
# If it is something that needds to be passed around or if several classes uses it, it is a module (it is modular)

	extend ActiveSupport::Concern 
	# Extend the methods inside ActiveSupport::Concern module 

	included do 
		before_action :configure_permitted_parameters, if: :devise_controller?
	end
		

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :address, :phone, :position, :group])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :address, :phone, :position, :group])
	end
end