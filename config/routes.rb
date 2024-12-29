Rails.application.routes.draw do
  # Set the landing page as the root
  root 'home#index'

  # Devise routes for user authentication, including OmniAuth callback handling
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Basic dashboard route
  get 'dashboard', to: 'posts#index'

  # Optional: If you want to have a route for the user's profile after login
  # get 'profile', to: 'users#show', as: 'profile'
end
