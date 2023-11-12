# frozen_string_literal: true

# Controller for users
class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    render json: @users.map { |user| { id: user.id, email: user.email, role: user.role } }
  end
end
