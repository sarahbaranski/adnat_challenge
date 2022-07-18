class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { request.format.html? }

  def current_user
    # auth_headers = request.headers["Authorization"]
    # if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
    #   token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
    #   begin
    #     decoded_token = JWT.decode(
    #       token,
    #       Rails.application.credentials.fetch(:secret_key_base),
    #       true,
    #       { algorithm: "HS256" }
    #     )
    # puts "current user id is.." + session[:current_user_id].to_s
    User.find_by(id: session[:current_user_id])
    # rescue JWT::ExpiredSignature
    #   nil
    # end
    # end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      flash.now[:alert] = "Unauthorized"
    end
  end

  def authenticate_admin
    unless current_user.admin
      flash.now[:alert] = "Unauthorized"
    end
  end
end
