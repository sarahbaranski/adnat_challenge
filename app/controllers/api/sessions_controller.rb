class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email_address: params[:email_address])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 365.days.from_now.to_i,
        },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      render json: { jwt: jwt, email_address: user.email_address, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
