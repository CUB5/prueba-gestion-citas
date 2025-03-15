class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permite añadir campos al formulario registro de usuario
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id, :username, :name, :surname])
    # Permite añadir campos al formulario de edicion de usuario
    devise_parameter_sanitizer.permit(:account_update, keys: [:role_id, :username, :name, :surname])
  end

end
