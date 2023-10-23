# frozen_string_literal: true

# Model for the groups
class Group < ApplicationRecord
  validates :name, presence: true

  has_many :subject_times, inverse_of: :group, dependent: :destroy
  has_many :tasks, inverse_of: :group, dependent: :destroy

  after_create :create_subject_times

  private

  def create_subject_times
    Subject.find_each do |subject|
      SubjectTime.create(subject_id: subject.id, group_id: id, time: nil)
    end
  end
end
