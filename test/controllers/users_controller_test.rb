# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    generate_tokens
  end

  test 'should get index' do
    get users_url, headers: { Authorization: @admin_token }
    assert_response :success
  end

  test 'should not get index' do
    get users_url, headers: { Authorization: @admin_token }
    assert_response :success
  end
end
