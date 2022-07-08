class ShiftsController < ApplicationController
  def index
    # @shifts = Shift.all
    # render "index.json.jb"
    @user_all_shifts = []
    @shift = Shift.where(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    @user_all = User.where(organisation_id: @user.organisation.id)
    @org = @user.organisation
    @hourly_rate = @user.organisation.hourly_rate

    @user_all.each do |user|
      if user != @user
        @user_all_shifts << Shift.find_by(user_id: user.id)
      end
    end
  end

  def update
    @shift = Shift.find_by(id: params[:id])
    if params[:date] && params[:start] == true
      start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
    elsif params[:date] && params[:finish] == true
      finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")
    end
    @shift.start = start_time || @shift.start
    @shift.finish = finish_time || @shift.finish
    @shift.break_length = params[:break_length] || @shift.break_length
    if @shift.save
      # TODO: redirect to users path with confirmation of shift updates.
      render "show.json.jb"
    else
      flash.now[:alert] = "Shifts were not updated"
    end
  end

  def create
    user = User.find_by(id: current_user.id)
    start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
    finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")

    @shift = Shift.new(
      user_id: current_user.id,
      start: start_time,
      finish: finish_time,
      break_length: params[:break_length],
    )
    if @shift.save
      # TODO: redirect to users path with confirmation of shift updates
      render "show.json.jb"
    else
      flash.now[:alert] = "Shifts were not created."
    end
  end

  def delete
    shift = Shift.find_by(id: params[:id])
    if shift.destroy
      flash.now[:notice] = "Shift was deleted."
    else
      flash.now[:alert] = "Shift was not deleted."
    end
  end
end
