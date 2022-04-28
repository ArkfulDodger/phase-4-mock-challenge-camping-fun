class SignupsController < ApplicationController
  # POST /signups
  def create
    new_signup = Signup.create!(signup_params)
    render json: new_signup.activity, status: :created
  end

  private

  # permissible params to be used by create/update
  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
