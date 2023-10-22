# frozen_string_literal: true

require 'test_helper'

class SubjectTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_time = subject_times(:one)
    @group = groups(:one)
    @subject = subjects(:two)
    generate_tokens
  end

  test 'should get time' do
    get subject_times_url(group_id: @subject_time.group_id, subject_id: @subject_time.subject_id),
        headers: { Authorization: @customer_token }, as: :json
    assert_response :success
  end

  test 'should get times' do
    get subject_times_url(subject_id: @subject.id),
        headers: { Authorization: @customer_token }, as: :json
    assert_equal(2, response.parsed_body.count)
  end

  test 'should update subject_time' do
    patch subject_times_url,
          params: { subject_times: [{ group_id: @subject_time.group_id, subject_id: @subject_time.subject_id,
                                      time: '14:10' }] }, headers: { Authorization: @admin_token }, as: :json
    assert_response :success
    date = Date.new(2000, 1, 1)
    time_zone = 'UTC'
    assert_equal DateTime.new(date.year, date.month, date.day,
                              '14:10'[0..1].to_i, '14:10'[3..4].to_i, 0,
                              time_zone), @subject_time.reload.time
  end

  test 'should not update subject_time 1' do
    patch subject_times_url,
          params: { subject_times: [{ subject_id: @subject_time.subject_id,
                                      time: '14:10' },
                                    { subject_id: @subject_time.subject_id,
                                      group_id: @subject_time.group_id,
                                      time: '14:10' }] }, headers: { Authorization: @admin_token }, as: :json
    assert_response :bad_request
  end

  test 'should not update subject_time 2' do
    patch subject_times_url,
          params: { subject_times: [{ group_id: @subject_time.group_id, subject_id: @subject_time.subject_id,
                                      time: '14:10' }] }, headers: { Authorization: @customer_token }, as: :json
    assert_response :forbidden
    assert_not_equal '14:10', @subject_time.reload.time
  end
end
