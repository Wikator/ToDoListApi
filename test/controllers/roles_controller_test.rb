# frozen_string_literal: true

require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    generate_tokens
  end

  test 'should get update_role' do
    user = users(:one)
    put update_role_put_url(user), params: { role_name: 'admin' },
                                   headers: { Authorization: @admin_token }, as: :json
    assert_response :success
    assert user.reload.admin?
  end

  test 'should not get and receive unauthorized' do
    user = users(:one)
    put update_role_put_url(user), params: { role_name: 'admin' },
                                   headers: { Authorization: @customer_token }, as: :json
    assert_response :forbidden
    assert_not user.reload.admin?
  end
end
