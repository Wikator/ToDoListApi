# frozen_string_literal: true

# Base class for all controllers
class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = 'You are not authorized to perform this task.'

    if current_user.present?
      render json: exception.message, status: :forbidden
    else
      render json: exception.message, status: :unauthorized
    end
  end
end
