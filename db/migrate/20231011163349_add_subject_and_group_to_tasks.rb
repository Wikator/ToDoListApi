# frozen_string_literal: true

# Migration for adding subject and group to tasks
class AddSubjectAndGroupToTasks < ActiveRecord::Migration[7.0]
  def change
    change_table :tasks, bulk: true do |t|
      t.add_column :subject_id, :integer
      t.add_column :group_id, :integer
    end

    add_foreign_key :tasks, :subjects
    add_foreign_key :tasks, :groups
  end
end
