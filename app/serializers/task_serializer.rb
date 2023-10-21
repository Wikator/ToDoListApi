# frozen_string_literal: true

# Serializer for tasks
class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :deadline
  belongs_to :category
  belongs_to :group
  belongs_to :subject
end
