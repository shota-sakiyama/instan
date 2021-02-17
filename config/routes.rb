Rails.application.routes.draw do
	root "users#new"
	resources :favorites, only: [:create, :destroy]
	resources :posts do
    resource :favorites, only: [:create, :destroy]
		collection do
			post :confirm
		end
	end
	resources :sessions, only: [:new, :create, :edit, :destroy]
	resources :users do
		resources :favorites
	end

end
