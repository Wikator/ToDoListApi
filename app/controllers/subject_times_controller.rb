# frozen_string_literal: true

# Controller for SubjectTime model
class SubjectTimesController < ApplicationController
  authorize_resource

  # GET /subject_times/time
  def time
    group_id = params[:group_id]
    subject_id = params[:subject_id]

    subject_time = SubjectTime.where(group_id:, subject_id:).select(:time).first
    render json: subject_time.time
  end

  # PATCH/PUT /subject_times/
  def update
    updated_subject_times = subject_times_params.map do |subject_time|
      group_id = subject_time[:group_id]
      subject_id = subject_time[:subject_id]
      time = subject_time[:time]

      subject_time = SubjectTime.find_by(group_id:, subject_id:)

      subject_time&.update(time:)
      subject_time
    end

    render json: updated_subject_times.compact
  end

  private

  # Only allow a list of trusted parameters through.
  def subject_times_params
    params.require(:subject_times).map { |subject_time| subject_time.permit(:subject_id, :group_id, :time) }
  end
end
