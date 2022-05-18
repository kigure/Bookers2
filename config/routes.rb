Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :users, only: [:index, :show, :create, :edit]
  resources :books, only: [:edit, :index, :show, :update, :create, :destroy]
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
