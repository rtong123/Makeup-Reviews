Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users do
    resources :reviews, only: [:index]
  end
  resources :makeups do
      resources :reviews
end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'

  # get '/user/reviews', to: 'users#index'
  # match '/users/:id/reviews', to: 'users#index', via: 'get', :as => 'user_reviews'

  get '/auth/facebook/callback' => 'sessions#facebook_login'
  get '/topinfluencers' => 'users#topinfluencers'
  get '/topreviews' => 'reviews#topreviews'
  get '/averageproducts' => 'reviews#averageproducts'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#delete'
end
