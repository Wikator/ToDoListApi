# frozen_string_literal: true

# Category model
class Category < ApplicationRecord
  validates :name, presence: true

  has_many :tasks, inverse_of: :category, dependent: :destroy
end
