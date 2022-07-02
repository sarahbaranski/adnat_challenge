class Api::OrganisationsController < ApplicationController
  def index
    render json: { message: "Hello" }
  end
end
