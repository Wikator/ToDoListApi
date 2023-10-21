class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :deadline
  belongs_to :author, class_name: 'User'
  belongs_to :category
  belongs_to :group
end
