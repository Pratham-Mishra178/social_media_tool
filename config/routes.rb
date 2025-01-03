Rails.application.routes.draw do
  # Set the landing page as the root
  root 'pages#login'

  # Devise routes for user authentication, including OmniAuth callback handling
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Settings route
  get 'settings', to: 'settings#show', as: 'settings'

  # Dashboard route
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard' # Updated to use PagesController
  get 'dashboard', to: 'pages#dashboard'
  get 'posts_dashboard', to: 'posts#dashboard'
  delete 'logout', to: 'sessions#destroy', as: :logout
  # Post creation routes
  resources :posts, only: [:index, :new, :create]
end
