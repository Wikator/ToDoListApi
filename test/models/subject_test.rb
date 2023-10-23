# frozen_string_literal: true

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test 'Create subject and subject_time' do
    assert_difference('SubjectTime.count', Group.count) do
      Subject.create(name: 'Subject 3')
    end
  end
end
