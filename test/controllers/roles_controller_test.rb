# frozen_string_literal: true

require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  test 'should get update_role' do
    token = sign_in_as_admin
    user = users(:one)
    put roles_update_role_url(role: 'admin', user_id: user.id), headers: { Authorization: token }, as: :json
    assert_response :success
    assert user.reload.admin?
  end

  test 'should not get and receive bad request' do
    token = sign_in_as_admin
    user = users(:one)
    put roles_update_role_url(role: 'admin'), headers: { Authorization: token }, as: :json
    assert_response :bad_request
    assert_not user.reload.admin?
  end

  test 'should not get and receive unauthorized' do
    token = sign_in_as_customer
    user = users(:one)
    put roles_update_role_url(role: 'admin', user_id: user.id), headers: { Authorization: token }, as: :json
    assert_response :forbidden
    assert_not user.reload.admin?
  end
end
