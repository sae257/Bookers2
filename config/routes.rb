Rails.application.routes.draw do
  devise_scope :user do
  end
  devise_for :users
  root to: "homes#top"
  get "/home/about", to: 'homes#about', as: 'about'
  resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:create, :index, :edit, :show, :update, :destroy ]
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
