# frozen_string_literal: true

# Controller for the groups
class GroupsController < ApplicationController
  load_and_authorize_resource

  # GET /groups
  def index
    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name)
  end
end
