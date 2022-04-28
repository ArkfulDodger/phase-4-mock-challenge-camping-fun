class ActivitiesController < ApplicationController
  before_action :find_activity, only: %i[destroy]

  # GET /activity
  def index
    activities = Activity.all
    render json: activities
  end

  # DELETE /activities/:id
  def destroy
    @activity.destroy

    head :no_content
    # render json: @activity, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_activity
    @activity = Activity.find(params[:id])
  end
end
