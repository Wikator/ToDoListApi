# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    generate_tokens
  end

  test 'should get index' do
    get categories_url, as: :json
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } },
                           headers: { Authorization: @admin_token }, as: :json
    end

    assert_response :created
  end

  test 'should not create category' do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } },
                           headers: { Authorization: @customer_token }, as: :json
    end
  end

  test 'should show category' do
    get category_url(@category), as: :json
    assert_response :success
  end

  test 'should update category' do
    patch category_url(@category), params: { category: { name: @category.name } },
                                   headers: { Authorization: @admin_token },
                                   as: :json
    assert_response :success
  end

  test 'should not update category' do
    patch category_url(@category), params: { category: { name: @category.name } },
                                   headers: { Authorization: @customer_token },
                                   as: :json
    assert_response :forbidden
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category), headers: { Authorization: @admin_token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy category' do
    assert_no_difference('Category.count') do
      delete category_url(@category), headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end
end
