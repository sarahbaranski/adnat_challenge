class Api::ShiftsController < ApplicationController
  def index
    @shift = Shift.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)

    @shift.each do |shift|
      shift[:hours_worked] = TimeDifference.between(shift.start, shift.finish).in_minutes
    end
  end
end
