class RedirectionController < ApplicationController
  def index

  	  if current_user.role == 'super_admin'
        redirect_to rails_admin_path
      elsif current_user.role == 'admin'
        redirect_to admin_path
      else
        redirect_to member_path
      end
  end
end
