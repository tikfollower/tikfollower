class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_filter :authorize_request
  # respond_to :json

  def render_error(error_type, message, status_code = 200)
    render :json => {
      success: false,
      error: {
        code: Constants::ERROR_CODES[error_type.to_sym],
        message: message
      }
    }, status: status_code
  end


  def render_message(message)
    render :json => {
      success: true,
      message: message
    } , :status => 201
  end

  def render_object_success(object, message, status, object_name)

    render :json => {
      success: true,
      data: object.as_json,
      message: message
    }, :status=>status
  end

  # def authorize_request
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   begin
  #     @decoded = JsonWebToken.decode(header)
  #     @current_user = User.find(@decoded[:user_id])
  #     rescue ActiveRecord::RecordNotFound => e
  #       render json: { errors: e.message }, status: :unauthorized
  #     rescue JWT::DecodeError => e
  #       render json: { errors: e.message }, status: :unauthorized
  #     end
  #   end
end
