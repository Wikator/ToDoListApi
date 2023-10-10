# frozen_string_literal: true

# Controller for roles
class RolesController < ApplicationController
  include AdminCheck

  def update_role
    role_param = params[:role]
    user_id_param = params[:user_id]

    return render_bad_request unless role_param && user_id_param

    user = User.find(user_id_param)
    user.update(role: role_param) ? render_success : render_error(user)
  end

  private

  def render_bad_request
    render json: { status: 400, message: 'Bad Request: Missing role or user_id parameter.' }
  end

  def render_success
    render json: { status: 200, message: 'Role updated successfully.' }
  end

  def render_error(user)
    render json: user.errors, status: :unprocessable_entity
  end
end
