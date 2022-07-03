class Api::OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    render "index.json.jb"
  end

  def create
    user = User.find_by(id: current_user.id)
    @organisation = Organisation.new(
      name: params[:name],
      hourly_rate: params[:hourly_rate],
    )
    @organisation.save
    render "show.json.jb"
  end

  def update
    organisation = Organisation.find_by(id: params[:id])
    organisation.name = params[:name] || organisation.name
    organisation.hourly_rate = params[:hourly_rate] || organisation.hourly_rate

    if organisation.save
      render json: { message: "Organisation saved." }
    else
      render json: { message: "Organisation did not save." }
    end
  end

  def delete
    user = User.find_by(id: current_user.id)
    @organisation = Organisation.find_by(id: params[:id])
    @organisation.destroy
    render json: { message: "Organisation has been deleted." }
  end
end
