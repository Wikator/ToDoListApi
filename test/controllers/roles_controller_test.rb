# frozen_string_literal: true

require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  test 'should get update_role' do
    get roles_update_role_url
    assert_response :success
  end
end
