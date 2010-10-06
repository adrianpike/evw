class ApplicationController < ActionController::Base
  protect_from_forgery

	def ensure_admin!
		redirect_to '/' unless current_user and current_user.admin
	end

end
