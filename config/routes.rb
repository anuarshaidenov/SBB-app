Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/types', to: 'types#index', as: 'user_root'
  get '/types', to: 'types#index', as: 'user'

  resources :splash_screen, only: [:index]
  resources :types, only: [:index, :new, :create] do
    resources :spendings, only: [:index, :show, :new]
  end
  # Defines the root path route ("/")
  unauthenticated do
    root "splash_screen#index"
  end

  authenticated :user do
    root 'types#index', as: :authenticated_root
  end
end
