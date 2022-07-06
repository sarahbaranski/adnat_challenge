class SessionsController < ApplicationController
  def new
  end

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
      redirect_to users_path(user.id), notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to root_path
    end
  end
end
