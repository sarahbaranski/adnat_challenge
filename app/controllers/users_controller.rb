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

  # Add user to organisation
  def edit
    @user = User.find_by(id: params[:id])
    org_id = params[:organisation_id]
    if @user.update_attribute(:organisation_id, org_id)
      # TODO: want this to be redirected to shifts
      redirect_to orgs_path(org_id), notice: "User added to organisation."
    else
      flash.now[:alert] = "User not added to organisation."
    end
  end

  # User leaves organisation and shifts are dropped
  def leave_org
    user = User.find_by(id: params[:id])
    user.organisation_id = nil
    user.shifts.destroy_all
    user.save
    redirect_to users_path
  end
end
