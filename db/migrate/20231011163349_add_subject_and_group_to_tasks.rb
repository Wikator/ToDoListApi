# frozen_string_literal: true

# MIgration for adding subject and group to tasks
class AddSubjectAndGroupToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :subject_id, :integer
    add_column :tasks, :group_id, :integer

    add_foreign_key :tasks, :subjects
    add_foreign_key :tasks, :groups
  end
end
