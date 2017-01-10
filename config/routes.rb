Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create] do
  	resources :recommendations, only: [:index, :create, :update, :destroy]
  # resources :users do
  # 	resources :recommendations
  end

  root 'application#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
