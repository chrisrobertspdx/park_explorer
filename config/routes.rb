Rails.application.routes.draw do
  
  root to: "parks#index"
  
  resources :categories
  resources :photos
  resources :parks
  
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
end
