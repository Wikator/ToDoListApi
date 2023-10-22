# frozen_string_literal: true

# Controller for SubjectTime model
class SubjectTimesController < ApplicationController
  authorize_resource

  # GET /subject_times
  def index
    group_id = params[:group_id]
    subject_id = params[:subject_id]
    subject_times = SubjectTime.all
    subject_times = subject_times.where(group_id:) if group_id.present?
    subject_times = subject_times.where(subject_id:) if subject_id.present?
    render json: subject_times
  end

  # PATCH/PUT /subject_times/
  def update
    updated_subject_times = update_from_params
    if updated_subject_times.include?(nil)
      render json: { errors: 'subject_id and group_id are required' }, status: :bad_request
    else
      updated_subject_times.each(&:save)
      render json: updated_subject_times.compact
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def subject_times_params
    params.require(:subject_times).map { |subject_time| subject_time.permit(:subject_id, :group_id, :time) }
  end

  def update_from_params
    subject_times_params.map do |subject_time|
      group_id = subject_time[:group_id]
      subject_id = subject_time[:subject_id]
      time = subject_time[:time]

      if group_id.blank? || subject_id.blank?
        nil
      else
        update_subject_time(group_id, subject_id, time)
      end
    end
  end

  def update_subject_time(group_id, subject_id, time)
    subject_time = SubjectTime.find_by(group_id:, subject_id:)
    subject_time.time = time
    subject_time
  end
end
