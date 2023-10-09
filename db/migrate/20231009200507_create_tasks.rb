# frozen_string_literal: true

# Migration to create tasks
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.integer :author_id, null: false
      t.datetime :deadline

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end
