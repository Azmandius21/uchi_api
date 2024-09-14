class Api::V1::StudentsController < AppLicationController
  before_action :set_student, only: [:destroy]

  def create
    @student = Student.new student_params

    if @student.save
      token = generate_auth_token(@student.id)
      UserToken.create(token: token, user_id: @student.id)

      render json: @student,
             status: :created,
             headers: { 'X-Auth-Token': token }
    else
      render json: { errors: @student.errors.full_messages },
             status: :method_not_allowed
    end
  end

  def destroy
    render_bad_request unless @student

    token = request.headers['X-Auth-Token']
    user_token = UserToken.find_by(user_id: @student.id).token

    render_unauthorized unless token == user_token

    @student.destroy
  end

  def index
    school = School.find(params[:school_id])
    klass = school.classes.find(params[:class_id])
    students = klass.students

    render json: { data: students }, status: :ok
  end

  private

  def set_student
    Student.find(params[:user_id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end

  def generate_auth_token(user_id)
    Digest::SHA256.hexdigest("#{user_id}#{ Rails.application.secrets.secret_key_base}")
  end

  def render_bad_request
    render json: { error: 'Некорректный id студента'},
           status: :bad_request
  end

  def render_unauthorized
    render json: { error: 'Некорректная авторизация'},
           status: :unauthorized
  end
end
