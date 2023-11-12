# frozen_string_literal: true

# Serializer for subject times when fetched through subject
class SubjectTimeForSubjectsSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :group

  def time
    object.time&.strftime('%H:%M:%S')
  end
end
