Rails.application.routes.draw do

    get 'redirection/index'
 	get 'member', to: 'member#index'
  	get 'admin', to: 'admin#index'
  	post 'admin/create_user', to: 'admin#create', as: 'admin_create_user'

	devise_for :users, controllers: {
		sessions: 'user/sessions',
		# registrations: 'users/registrations'
	}

	devise_scope :user do
	  authenticated :user do
	    root 'redirection#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	  
	  get '/signout', to: 'devise/sessions#destroy', as: :signout
	end

  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
