Evw::Application.routes.draw do
  devise_for :users

	resources :users

  resources :entries do
		collection do
			get 'unapproved'
		end
		member do
		 	get 'approve'
		end
	end

  root :to => "entries#index"
end
