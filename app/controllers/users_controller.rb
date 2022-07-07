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
      flash.now[:alert] = "New user not created."
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.name = params[:name] || @user.name
    @user.email_address = params[:email_address] || @user.email_address
    @user.password = params[:password] || @user.password
    if @user.save
      render "show.json.jb"
      # TODO: redirect to shifts path and confirm update
    else
      flash.now[:alert] = "User not updated."
    end
  end

  def show
    id = current_user&.id || params[:id]
    @user = User.find_by(id: id)
    @organisation = Organisation.all
  end

  # Add organisation to user
  def edit
    @user = User.find_by(id: params[:id])
    if @user.update_attribute(:organisation_id, params[:organisation_id])
      # TODO: want this to be redirected to shifts
      redirect_to :users, notice: "User added to organisation."
    else
      flash.now[:alert] = "User not added to organisation."
    end
  end
end
