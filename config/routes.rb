Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home_pages#index"
  
  get 'splash_screen/index'

  resources :home_pages, only: [:index, :new, :create] do 
    resources :expenses, only: [:index, :new, :create]
  end
end
