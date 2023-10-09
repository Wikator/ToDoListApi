# frozen_string_literal: true

# Task model
class Task < ApplicationRecord
  validates :name, presence: true
  validates :author_id, presence: true
end
