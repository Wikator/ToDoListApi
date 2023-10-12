# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'should get index' do
    get categories_url, as: :json
    assert_response :success
  end

  test 'should create category' do
    token = sign_in_as_admin
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } }, headers: { Authorization: token }, as: :json
    end

    assert_response :created
  end

  test 'should not create category' do
    token = sign_in_as_customer
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } }, headers: { Authorization: token }, as: :json
    end
  end

  test 'should show category' do
    get category_url(@category), as: :json
    assert_response :success
  end

  test 'should update category' do
    token = sign_in_as_admin
    patch category_url(@category), params: { category: { name: @category.name } }, headers: { Authorization: token },
                                   as: :json
    assert_response :success
  end

  test 'should not update category' do
    token = sign_in_as_customer
    patch category_url(@category), params: { category: { name: @category.name } }, headers: { Authorization: token },
                                   as: :json
    assert_response :unauthorized
  end

  test 'should destroy category' do
    token = sign_in_as_admin
    assert_difference('Category.count', -1) do
      delete category_url(@category), headers: { Authorization: token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy category' do
    token = sign_in_as_customer
    assert_no_difference('Category.count') do
      delete category_url(@category), headers: { Authorization: token }, as: :json
    end

    assert_response :unauthorized
  end
end
