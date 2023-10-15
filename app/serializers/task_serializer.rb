# frozen_string_literal: true

# Serializer for the tasks
class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :category
end
