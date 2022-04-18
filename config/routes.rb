Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "splash_screen#index"
  resources :home_pages, only: [:index, :new, :create, :show]
end
