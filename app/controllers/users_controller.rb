class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      redirect_to root_path status: 200
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.name = params[:name] || @user.name
    @user.email_address = params[:email_address] || @user.email_address
    @user.password = params[:password] || @user.password
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_message }, status: :unprocessable_entity
    end
  end

  def show
    id = current_user&.id || params[:id]
    @user = User.find_by(id: id)
    @organisation = Organisation.all
  end

  def edit
    @user = User.find_by(id: current_user.id)
    if @user.update_attribute(:organisation_id, params[:id])
      render json: { message: "User added to organisation." }
    else
      render json: { message: "User not added to organisation." }
    end
  end
end
