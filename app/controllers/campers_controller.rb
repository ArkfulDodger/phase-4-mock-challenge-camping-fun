class CampersController < ApplicationController
  before_action :find_camper, only: %i[show]

  # GET /camper
  def index
    campers = Camper.all
    render json: campers
  end

  # GET /campers/:id
  def show
    render json: @camper, serializer: CamperActivitiesSerializer
  end

  # POST /camper
  def create
    new_camper = Camper.create!(camper_params)
    render json: new_camper, status: :created
  end

  private

  # set instance variable for show/update/destroy
  def find_camper
    @camper = Camper.find(params[:id])
  end

  # permissible params to be used by create/update
  def camper_params
    params.permit(:name, :age)
  end
end
