class User::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :mobile_number])
		devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :mobile_number])
	end
end
