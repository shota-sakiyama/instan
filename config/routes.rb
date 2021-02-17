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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
