class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  allow_browser versions: :modern
end
