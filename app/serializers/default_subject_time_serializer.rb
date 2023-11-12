# frozen_string_literal: true

# Serializer for Subject Time
class DefaultSubjectTimeSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :subject
  belongs_to :group

  def time
    object.time&.strftime('%H:%M:%S')
  end
end
