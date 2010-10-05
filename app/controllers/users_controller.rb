class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		
	end
	
	def show
		@user = User.find_by_username(params[:id])
	end
end