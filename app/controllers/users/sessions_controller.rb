# frozen_string_literal: true

module Users
  # Controller for user sessions
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    respond_to :json

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def respond_with(resource, _options = {})
      return unless resource.persisted?

      render json: {
        status: { code: 200, message: 'User signed in succesfully.',
                  data: current_user }
      }, status: :ok
    end

    def respond_to_on_destroy
      if authenticated_user?
        render_success_response
      else
        render_unauthorized_response
      end
    end

    def authenticated_user?
      authorization_header = request.headers['Authorization']
      if authorization_header.present?
        token = authorization_header.split[1]
        jwt_payload = JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
        User.find(jwt_payload['sub']).present?
      else
        false
      end
    end

    def render_success_response
      render json: {
        status: 200,
        message: 'Signed out successfully.'
      }, status: :ok
    end

    def render_unauthorized_response
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
