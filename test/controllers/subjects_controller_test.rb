# frozen_string_literal: true

require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end

  test 'should get index' do
    get subjects_url, as: :json
    assert_response :success
  end

  test 'should create subject' do
    token = sign_in_as_admin
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { name: @subject.name } }, headers: { Authorization: token }, as: :json
    end

    assert_response :created
  end

  test 'should not create subject' do
    token = sign_in_as_customer
    assert_no_difference('Subject.count') do
      post subjects_url, params: { subject: { name: @subject.name } }, headers: { Authorization: token }, as: :json
    end

    assert_response :forbidden
  end

  test 'should show subject' do
    token = sign_in_as_customer
    get subject_url(@subject), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test 'should update subject' do
    token = sign_in_as_admin
    patch subject_url(@subject), params: { subject: { name: @subject.name } }, headers: { Authorization: token },
                                 as: :json
    assert_response :success
  end

  test 'should not update subject' do
    token = sign_in_as_customer
    patch subject_url(@subject), params: { subject: { name: @subject.name } }, headers: { Authorization: token },
                                 as: :json
    assert_response :forbidden
  end

  test 'should destroy subject' do
    token = sign_in_as_admin
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject), headers: { Authorization: token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy subject' do
    token = sign_in_as_customer
    assert_no_difference('Subject.count') do
      delete subject_url(@subject), headers: { Authorization: token }, as: :json
    end

    assert_response :forbidden
  end
end
