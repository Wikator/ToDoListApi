# frozen_string_literal: true

# Serializer for the categories
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end
