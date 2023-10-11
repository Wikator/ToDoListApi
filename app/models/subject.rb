# frozen_string_literal: true

# Model for the subjects
class Subject < ApplicationRecord
  validates :name, presence: true

  has_many :subject_times, inverse_of: :subject, dependent: :destroy
  has_many :tasks, inverse_of: :subject, dependent: :destroy
end
