# frozen_string_literal: true

# Controller for tasks
class TasksController < ApplicationController
  load_and_authorize_resource

  # GET /tasks
  def index
    render json: @tasks
  end

  # GET /my_tasks
  def my_tasks
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task.author_id = current_user.id

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :category_id, :group_id,
                                 :subject_id)
  end
end
