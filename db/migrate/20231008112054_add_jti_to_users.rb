# frozen_string_literal: true

# Migration to add jti to users
class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string, null: false
    add_index  :users, :jti, unique: true
  end
end
