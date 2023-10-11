# frozen_string_literal: true

# Migration for the subject_times
class CreateSubjectTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_times do |t|
      t.integer :subject_id, null: false
      t.integer :group_id, null: false
      t.time :time

      t.timestamps
    end

    add_foreign_key :subject_times, :subjects
    add_foreign_key :subject_times, :groups
  end
end
