# frozen_string_literal: true

# Migration to add groups to users
class AddedGroupToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :group_id, :integer, null: true

    add_foreign_key :users, :groups
  end
end
