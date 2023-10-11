# frozen_string_literal: true

require 'test_helper'

class SubjectTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_time = subject_times(:one)
  end

  test 'should get index' do
    get subject_times_url, as: :json
    assert_response :success
  end

  test 'should create subject_time' do
    assert_difference('SubjectTime.count') do
      post subject_times_url,
           params: { subject_time: { group_id: @subject_time.group_id, subject_id: @subject_time.subject_id,
                                     time: @subject_time.time } }, as: :json
    end

    assert_response :created
  end

  test 'should show subject_time' do
    get subject_time_url(@subject_time), as: :json
    assert_response :success
  end

  test 'should update subject_time' do
    patch subject_time_url(@subject_time),
          params: { subject_time: { group_id: @subject_time.group_id, subject_id: @subject_time.subject_id,
                                    time: @subject_time.time } }, as: :json
    assert_response :success
  end

  test 'should destroy subject_time' do
    assert_difference('SubjectTime.count', -1) do
      delete subject_time_url(@subject_time), as: :json
    end

    assert_response :no_content
  end
end
