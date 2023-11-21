Rails.application.routes.draw do
 get '/health', to: 'health#health'
 resources :users, only: [:index, :show, :create, :update, :destroy]
 resources :posts, only: [:index, :show]
end
