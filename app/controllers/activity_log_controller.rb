class ActivityLogController < ApplicationController
  def set_habit
    @habit = Habit.find_by_id(params[:id])
  end

  post '/habits/:id/activity' do
    if logged_in?
      set_habit
      @habit.activity_logs.create(params[:activity_log])
      redirect to "/habits/#{@habit.id}"

    else
      redirect to '/login'
    end
  end


  delete '/habits/:id/delete' do
    set_habit
    if @habit.user == current_user
      @habit.delete
    end
    redirect to '/habits'
  end


end
