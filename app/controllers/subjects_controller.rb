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
    if duplicate_group_ids?(subject_params[:subject_times_attributes])
      render json: 'Duplicate group_id values are not allowed', status: :bad_request
    elsif @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_update_params)
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
    params.require(:subject).permit(:name, subject_times_attributes: %i[group_id time])
  end

  def subject_update_params
    params.require(:subject).permit(:name)
  end

  def duplicate_group_ids?(subject_times)
    group_ids = subject_times&.map { |attributes| attributes[:group_id] }
    group_ids.present? && group_ids.size != group_ids.uniq.size
  end
end
