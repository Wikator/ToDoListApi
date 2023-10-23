# frozen_string_literal: true

# Controller for SubjectTime model
class SubjectTimesController < ApplicationController
  authorize_resource
  before_action :load_resource, only: [:update]

  # GET /subjects/:subject_id/subject_times
  # GET /groups/:group_id/subject_times
  # GET /subject_times
  def index
    subject_times = if params[:subject_id].present?
                      SubjectTime.where(subject_id: params[:subject_id])
                    elsif params[:group_id].present?
                      SubjectTime.where(group_id: params[:group_id])
                    else
                      SubjectTime.all
                    end

    render json: subject_times
  end

  # PATCH/PUT /subject_times/
  def update
    if @subject_time.update(subject_times_params)
      render json: @subject_time
    else
      render json: @subject_time.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def subject_times_params
    params.require(:subject_time).permit(:time)
  end

  def load_resource
    @subject_time = SubjectTime.find(params[:id])
  end
end
