class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

  # Method to handle LinkedIn OAuth callback
  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize

    # Set user attributes from LinkedIn data
    user.name = auth.info.name
    user.email = auth.info.email

    # Only set the password if the user is new (during initial registration)
    if user.new_record?
      user.password = Devise.friendly_token[0, 20]
    end
    
    # Save the user
    user.save
    user
  end
end
