Rails.application.routes.draw do
	root "sessions#new"
	resources :favorites
	resources :posts do
    resource :favorites
		collection do
			post :confirm
		end
	end
	resources :sessions
	resources :users do
		resources :favorites
	end
	mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
