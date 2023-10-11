# frozen_string_literal: true

# Model for the groups
class Group < ApplicationRecord
  validates :name, presence: true

  has_many :subject_times, inverse_of: :group, dependent: :destroy
  has_many :tasks, inverse_of: :group, dependent: :destroy
end
