class Api::UsersController < ApplicationController
  def create
    @user = User.new(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      render json: { message: "User created succesfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    if @user.update_attribute(:organisation_id, params[:id])
      render json: { message: "User added to organisation." }
    else
      render json: { message: "User not added to organisation." }
    end
  end
end
