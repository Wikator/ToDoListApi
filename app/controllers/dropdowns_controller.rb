# frozen_string_literal: true

# Controller for the dropdowns
class DropdownsController < ApplicationController
  # GET /dropdowns/tasks
  def task_dropdowns
    authorize! :task_dropdowns, DropdownsController

    data = {
      groups: Group.pluck(:id, :name).map { |group| { id: group[0], name: group[1] } },
      categories: Category.pluck(:id, :name).map { |category| { id: category[0], name: category[1] } },
      subjects: Subject.pluck(:id, :name).map { |subject| { id: subject[0], name: subject[1] } }
    }

    render json: data
  end
end
