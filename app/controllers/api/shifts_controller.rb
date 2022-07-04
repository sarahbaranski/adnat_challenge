class Api::ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    render "index.json.jb"
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
      render "show.json.jb"
    else
      rend json: { message: "Shift did not save." }
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
      render "show.json.jb"
    else
      render json: { message: "Shift was not created." }
    end
  end

  def delete
    shift = Shift.find_by(id: params[:id])
    if shift.destroy
      render json: { message: "Shift destroyed." }
    else
      render json: { message: "Shift was not deleted." }
    end
  end
end
