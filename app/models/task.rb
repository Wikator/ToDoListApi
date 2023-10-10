# frozen_string_literal: true

# Task model
class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :author, class_name: 'User', inverse_of: :tasks
  belongs_to :category, inverse_of: :tasks
end
