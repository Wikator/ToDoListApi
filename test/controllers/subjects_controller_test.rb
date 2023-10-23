# frozen_string_literal: true

require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
    generate_tokens
  end

  test 'should get index' do
    get subjects_url, as: :json
    assert_response :success
  end

  test 'should get subject times' do
    get subject_subject_times_url(@subject)
    assert_equal(Group.count, response.parsed_body.count)
  end

  test 'should create subject' do
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { name: @subject.name } }, headers: { Authorization: @admin_token },
                         as: :json
    end

    assert_response :created
  end

  test 'should not create subject' do
    assert_no_difference('Subject.count') do
      post subjects_url, params: { subject: { name: @subject.name } },
                         headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end

  test 'should show subject' do
    get subject_url(@subject), headers: { Authorization: @customer_token }, as: :json
    assert_response :success
  end

  test 'should update subject' do
    patch subject_url(@subject), params: { subject: { name: @subject.name } },
                                 headers: { Authorization: @admin_token },
                                 as: :json
    assert_response :success
  end

  test 'should not update subject' do
    patch subject_url(@subject), params: { subject: { name: @subject.name } },
                                 headers: { Authorization: @customer_token },
                                 as: :json
    assert_response :forbidden
  end

  test 'should destroy subject' do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject), headers: { Authorization: @admin_token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy subject' do
    assert_no_difference('Subject.count') do
      delete subject_url(@subject), headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end
end
