# frozen_string_literal: true

# Serializer for subject times when fetched through group
class SubjectTimeForGroupsSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :subject

  def time
    object.time&.strftime('%H:%M:%S')
  end
end
