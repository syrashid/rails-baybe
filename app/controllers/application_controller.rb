class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :phone, :avatar, :address])
  end
end
