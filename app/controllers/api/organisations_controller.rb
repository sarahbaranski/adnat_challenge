class Api::OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    render "index.json.jb"
  end

  def create
    @organisation = Organisation.new(
      name: params[:name],
      hourly_rate: params[:hourly_rate],
    )
    @organisation.save
    render "show.json.jb"
  end
end
