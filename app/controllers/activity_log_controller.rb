class ActivityController < ApplicationController
  def set_habit
    @habit = Habit.find_by_id(params[:id])
  end

  post '/habits/:id/activity' do
    if logged_in?
      set_habit
      redirect to "/habits/#{@habit.id}"

    else
      redirect to '/login'
    end
  end


end
