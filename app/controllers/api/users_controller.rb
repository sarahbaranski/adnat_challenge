class Api::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password],
      password_confimation: params[:password_confimation],
    )
    if user.save
      render json: { message: "User created succesfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
