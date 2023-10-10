# frozen_string_literal: true

# Controller for tasks
class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /my_tasks
  def my_tasks
    @tasks = current_user.tasks

    render json: @tasks, status: :ok
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.author_id = current_user.id

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.author_id == current_user.id
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401, message: 'You are not authorized to update this task.' }
    end
  end

  # DELETE /tasks/1
  def destroy
    if @task.author_id == current_user.id
      @task.destroy
    else
      render json: { status: 401, message: 'You are not authorized to delete this task.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
