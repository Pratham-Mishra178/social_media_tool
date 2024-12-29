# frozen_string_literal: true

Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = 'no-reply@yourdomain.com'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> OmniAuth
  # Configure OmniAuth for LinkedIn with hardcoded credentials
  config.omniauth :linkedin, 
                  '86mton83xfu2u7',  # Your LinkedIn Client ID
                  'WPL_AP1.M6DBTJuxvh8Rgbyf.q+0yHg==',  # Your LinkedIn Client Secret
                  scope: 'r_liteprofile r_emailaddress w_member_social'

  # Define a custom prefix for OmniAuth routes
  config.omniauth_path_prefix = '/users/auth'

  # ==> Authentication Configuration
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  
  # ==> Token Configuration
  config.stretches = Rails.env.test? ? 1 : 12
  config.reset_password_within = 6.hours
  config.expire_all_remember_me_on_sign_out = true

  # ==> Navigational Formats
  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # ==> Turbo/Hotwire Configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # ==> Account Confirmation
  config.reconfirmable = true

  # ==> Sign-out Method
  config.sign_out_via = :delete

  # ==> Rememberable Configuration
  config.remember_for = 2.weeks

  # ==> Password Validation
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
end
