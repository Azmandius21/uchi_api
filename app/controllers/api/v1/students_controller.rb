class Api::V1::StudentsController < ApplicationController
  def index
    school = School.find(params[:school_id])
    klass = school.klasses.find(params[:klass_id])
    students = klass.students

    render json: { students: students }, status: :ok
  end

  def create
    @student = Student.new student_params

    Student.transaction do
      @student.save
      auth_token = @student.generate_auth_token
      UserToken.create(token: auth_token, user_id: @student.id)

      response.headers['X-Auth-Token'] = "#{auth_token}"
      render json: @student
    end

    return if @student.persisted?

    render json: { errors: @student.errors.full_messages },
           status: :method_not_allowed
  end

  def destroy
    @student = Student.find(params[:id])

    render_bad_request unless @student

    token = request.headers['X-Auth-Token']
    user_token = UserToken.find_by(user_id: @student.id).token

    render_unauthorized unless token == user_token

    @student.destroy
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end

  def render_bad_request
    render json: { error: 'Некорректный id студента' },
           status: :bad_request
  end

  def render_unauthorized
    render json: { error: 'Некорректная авторизация' },
           status: :unauthorized
  end
end
