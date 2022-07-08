class OrganisationsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(id: params[:id])
    @organisation = Organisation.new(
      name: params[:name],
      hourly_rate: params[:hourly_rate],
    )
    if @organisation.save
      @user.organisation_id = @organisation.id
    end
    user.save
    # TODO: added frontend functionality to create an org, and redirect to users path once created with
  end

  def show
    @organisation = Organisation.find_by(id: params[:id])
    @shifts = @organisation.users.flat_map do |user|
      user.shifts
    end
  end

  def update
    organisation = Organisation.find_by(id: params[:id])
    organisation.name = params[:name] || organisation.name
    organisation.hourly_rate = params[:hourly_rate] || organisation.hourly_rate

    if organisation.save
      # TODO: redirect to users path, with confirmation org saved
    else
      flash.now[:alert] = "Organisation not saved."
    end
  end

  def delete
    user = User.find_by(id: current_user.id)
    @organisation = Organisation.find_by(id: params[:id])
    @organisation.destroy
    flash.now[:notice] = "Organisation has been deleted."
  end
end
