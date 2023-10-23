# frozen_string_literal: true

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'Create group and subject_time' do
    assert_difference('SubjectTime.count', Subject.count) do
      Group.create(name: 'Group 3')
    end
  end
end
