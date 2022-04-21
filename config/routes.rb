Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root to: "home_pages#index", as: :authenticated_root
  end

  resources :home_pages, only: [:index, :new, :create] do 
    resources :expenses, only: [:index, :new, :create]
  end

  root "splash_screen#index"
end
