# frozen_string_literal: true

require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
    generate_tokens
  end

  test 'should get index' do
    get groups_url, as: :json
    assert_response :success
  end

  test 'should get subject times' do
    get group_subject_times_url(@group)
    assert_equal(Subject.count, response.parsed_body.count)
  end

  test 'should create group' do
    assert_difference('Group.count') do
      post groups_url, params: { group: { name: @group.name } },
                       headers: { Authorization: @admin_token }, as: :json
    end

    assert_response :created
  end

  test 'should not create group' do
    assert_no_difference('Group.count') do
      post groups_url, params: { group: { name: @group.name } },
                       headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end

  test 'should show group' do
    get group_url(@group), as: :json
    assert_response :success
  end

  test 'should update group' do
    patch group_url(@group), params: { group: { name: @group.name } },
                             headers: { Authorization: @admin_token }, as: :json
    assert_response :success
  end

  test 'should not update group' do
    patch group_url(@group), params: { group: { name: @group.name } },
                             headers: { Authorization: @customer_token }, as: :json
    assert_response :forbidden
  end

  test 'should destroy group' do
    assert_difference('Group.count', -1) do
      delete group_url(@group), headers: { Authorization: @admin_token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy group' do
    assert_no_difference('Group.count') do
      delete group_url(@group), headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end
end
