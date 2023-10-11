# frozen_string_literal: true

# Model for the subject times
class SubjectTime < ApplicationRecord
  belongs_to :subject, inverse_of: :subject_times
  belongs_to :group, inverse_of: :subject_times
end
