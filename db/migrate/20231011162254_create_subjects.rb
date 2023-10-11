# frozen_string_literal: true

# Migration for the subjects
class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
