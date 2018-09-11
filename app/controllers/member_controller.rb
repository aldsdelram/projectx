class MemberController < ApplicationController
  authorize_resource :class => false
  
  def index
  	authorize! :index, :member
  end
end
