class Api::V1::KlassesController < AppLicationController
  def index
    school = School.find(params[:school_id])

    render json: { data: school.klasses }, status: :ok
  end
end
