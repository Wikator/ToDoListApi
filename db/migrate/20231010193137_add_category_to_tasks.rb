# frozen_string_literal: true

# Migration to add category to tasks
class AddCategoryToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :category_id, :integer, null: false
    add_foreign_key :tasks, :categories
  end
end
