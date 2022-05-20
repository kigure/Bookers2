Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :books, only: [:edit, :index, :show, :update, :create, :destroy]
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
