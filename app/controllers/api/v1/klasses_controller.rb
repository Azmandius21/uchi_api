class Api::V1::KlassesController < ApplicationController
  def index
    school = School.find(params[:school_id])

    render json: { klasses: school.klasses }
  end
end
