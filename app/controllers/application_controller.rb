class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  # before_action :authorize_request
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def api_path
    request.original_url.include?('api')
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :role, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :role, :password, :current_password)
    end
  end
end
