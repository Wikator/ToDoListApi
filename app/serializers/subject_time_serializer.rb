# frozen_string_literal: true

# Serializer for Subject Time
class SubjectTimeSerializer < ActiveModel::Serializer
  attributes :id, :subject, :group, :time
  belongs_to :subject
  belongs_to :group
end
