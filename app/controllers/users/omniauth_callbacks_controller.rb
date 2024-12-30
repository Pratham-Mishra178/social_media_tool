class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    # Use 'from_omniauth' method in the User model
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # If user is successfully found or created, sign in and redirect
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'LinkedIn') if is_navigational_format?
    else
      # If there is an issue, store data in the session and redirect
      session['devise.linkedin_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: 'There was an error while trying to authenticate you via LinkedIn. Please try again.'
    end
  end

  def failure
    # Handle failure scenario and redirect to the root path with an error message
    redirect_to root_path, alert: 'Authentication failed. Please try again.'
  end
end
