Rails.application.routes.draw do
  get 'favorites/index'
  get 'posts/index'
  get 'sessions/new'
  resources :users
  resources :sessions
  resources :posts do
    collection do   
      post :confirm
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
