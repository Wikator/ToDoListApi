# frozen_string_literal: true

# Module to check if the user is an admin
module AdminCheck
  extend ActiveSupport::Concern

  included do
    before_action :check_admin
  end

  private

  def check_admin
    return if current_user&.admin?

    render plain: 'Unauthorized', status: :unauthorized
  end
end
