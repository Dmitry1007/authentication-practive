Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
  # scope "/admin", as: "/admin", module: "/admin" do
  #   resources :photos
  # end

  # scope "/store/:id" do
  #   resources :pets
  # resources :user
  # end
end
