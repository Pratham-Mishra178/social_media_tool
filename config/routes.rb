# config/routes.rb
Rails.application.routes.draw do
  # Set the landing page as the root
  root 'pages#login'

  # Devise routes for user authentication, including OmniAuth callback handling
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Basic dashboard route
  get 'dashboard', to: 'posts#dashboard'

  # Post creation routes
  resources :posts, only: [:index, :new, :create]
end
