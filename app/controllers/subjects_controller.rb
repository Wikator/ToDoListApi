# frozen_string_literal: true

# Controller for the subjects
class SubjectsController < ApplicationController
  load_and_authorize_resource

  # GET /subjects
  def index
    render json: @subjects
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    if @subject.save
      group_ids = Group.pluck(:id)

      group_ids.each do |group_id|
        SubjectTime.create(group_id:, subject_id: @subject.id)
      end

      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name)
  end
end
