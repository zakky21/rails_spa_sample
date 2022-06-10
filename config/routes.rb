Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :todos, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :labels, only: [:index, :show, :edit, :create, :destroy]
end
