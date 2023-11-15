# frozen_string_literal: true

# Migration for adding created by admin to tasks
class AddedCreatedByAdminToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :created_by_admin, :boolean, null: false, default: false
  end
end
