# Frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
