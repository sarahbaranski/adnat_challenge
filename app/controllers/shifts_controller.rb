class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def update
    @shift = Shift.find_by(id: params[:id])

    if params[:date] && params[:start]
      start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
    end
    if params[:date] && params[:finish]
      finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")
    end
    @shift.start = start_time || @shift.start
    @shift.finish = finish_time || @shift.finish
    @shift.break_length = params[:break_length] || @shift.break_length
    if @shift.save
      flash.now[:notice] = "Shifts were updated"
    else
      flash.now[:alert] = "Shifts were not updated"
    end
  end

  def create
    # TODO: figure out why current_user.id won't work
    user = User.find_by(id: params[:id])
    start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
    finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")
    # TODO: figure out, why current_user.id won't work
    @shift = Shift.new(
      user_id: current_user.id,
      start: start_time,
      finish: finish_time,
      break_length: params[:break_length],
    )
    if @shift.save
      # TODO: redirect to users path with confirmation of shift updates
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
