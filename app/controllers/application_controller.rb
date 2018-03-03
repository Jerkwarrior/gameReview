# Frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end
