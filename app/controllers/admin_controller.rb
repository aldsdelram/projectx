class AdminController < ApplicationController
  authorize_resource :class => false
  
  def index
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.role = 'member'
  	@user.password = 'password'
  	@user.password_confirmation = 'password'

    respond_to do |format|		
		if @user.save
		format.html { redirect_to(admin_path, :notice => "Member was successfully invited.") }
		else
		format.html { render :action => "index", :notice => "There is a problem" }
		end
	end

  end

  protected

  	def user_params
    	params.require(:user).permit(:first_name, :last_name, :email)
  	end

end
