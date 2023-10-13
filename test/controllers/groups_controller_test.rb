# frozen_string_literal: true

require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test 'should get index' do
    get groups_url, as: :json
    assert_response :success
  end

  test 'should create group' do
    token = sign_in_as_admin
    assert_difference('Group.count') do
      post groups_url, params: { group: { name: @group.name } }, headers: { Authorization: token }, as: :json
    end

    assert_response :created
  end

  test 'should not create group' do
    token = sign_in_as_customer
    assert_no_difference('Group.count') do
      post groups_url, params: { group: { name: @group.name } }, headers: { Authorization: token }, as: :json
    end

    assert_response :forbidden
  end

  test 'should show group' do
    get group_url(@group), as: :json
    assert_response :success
  end

  test 'should update group' do
    token = sign_in_as_admin
    patch group_url(@group), params: { group: { name: @group.name } }, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test 'should not update group' do
    token = sign_in_as_customer
    patch group_url(@group), params: { group: { name: @group.name } }, headers: { Authorization: token }, as: :json
    assert_response :forbidden
  end

  test 'should destroy group' do
    token = sign_in_as_admin
    assert_difference('Group.count', -1) do
      delete group_url(@group), headers: { Authorization: token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy group' do
    token = sign_in_as_customer
    assert_no_difference('Group.count') do
      delete group_url(@group), headers: { Authorization: token }, as: :json
    end

    assert_response :forbidden
  end
end
