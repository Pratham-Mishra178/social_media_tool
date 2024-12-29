class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    # Use the 'from_omniauth' method to either find or create the user based on LinkedIn data
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # Sign in the user and redirect if authentication is successful
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'LinkedIn') if is_navigational_format?
    else
      # Store the LinkedIn authentication data in the session for use during registration
      session['devise.linkedin_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end
