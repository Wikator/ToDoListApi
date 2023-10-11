# frozen_string_literal: true

# Migration for the groups
class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, name: false

      t.timestamps
    end
  end
end
