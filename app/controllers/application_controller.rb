class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:user_points, :name, :profile_picture, :facebook_id, :phone_no, :username])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:user_points, :name, :profile_picture, :facebook_id, :phone_no, :username])
  end
end
