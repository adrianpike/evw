class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.create(params[:user])
		if @user.save then
			
		else
			
		end
  end

  def update
    super
  end
end