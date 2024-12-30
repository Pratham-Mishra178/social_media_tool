class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

  has_many :posts, dependent: :destroy
  
  # Method to handle LinkedIn OAuth callback
  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize

    # Safely set user attributes from LinkedIn data
    user.name = auth.info.name if auth.info.name.present?
    user.email = auth.info.email if auth.info.email.present?

    # Only set a password if the user is new (during initial registration)
    user.password ||= Devise.friendly_token[0, 20] if user.new_record?

    # Save the user if any changes are made
    user.save if user.changed?
    user
  end
end
